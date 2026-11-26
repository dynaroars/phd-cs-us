"""Label guide links with their last-updated dates and sort each section newest first.

For every bullet in the academic guides, this script looks up when each linked
resource was last updated, appends the most recent date as "(updated Mon YYYY)",
and orders each run of bullets from the most to the least recently updated.
Bullets without a known date keep their relative order after the dated ones.

Dates only move forward: an existing label is replaced only by a later date, so a
failed or blocked request never erases a date found earlier or added by hand.

Usage: python3 .github/scripts/link_dates.py [--check] [--verbose] [FILE ...]
"""

import argparse
from concurrent.futures import ThreadPoolExecutor
from datetime import datetime, timedelta, timezone
from email.utils import parsedate_to_datetime
import json
import os
from pathlib import Path
import re
import subprocess
import zlib
from urllib.error import HTTPError
from urllib.parse import unquote, urlsplit
from urllib.request import Request, urlopen

GUIDES = (
    "prospective-students.md",
    "current-students.md",
    "faculty-applications.md",
    "faculty-resources.md",
)
OWN_SITE = "https://roars.dev/phd-cs-us/"
OWN_REPO = "https://github.com/dynaroars/phd-cs-us/blob/main/"
MONTHS = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
LABEL = re.compile(r"\s*\(updated (?:([A-Z][a-z]{2}) )?(\d{4})\)\s*$")
LINK = re.compile(r"\]\(<?([^\s>)]+)>?\)")
EARLIEST = 1990
AGENT = "Mozilla/5.0 (compatible; AcademicGuideLinkDates/1.0)"


def today():
    return datetime.now(timezone.utc)


def valid(year, month=0):
    now = today()
    return EARLIEST <= year <= now.year and 0 <= month <= 12 and (year, month) <= (now.year, now.month)


def stamp(value):
    """Return a (year, month) tuple from a datetime, or None if out of range."""
    if value and valid(value.year, value.month):
        return value.year, value.month
    return None


def iso(text):
    match = re.match(r"\s*(\d{4})-(\d{2})(?:-(\d{2}))?", text or "")
    if match and valid(int(match[1]), int(match[2])):
        return int(match[1]), int(match[2])
    return None


MONTH_NAMES = r"(Jan(?:uary)?|Feb(?:ruary)?|Mar(?:ch)?|Apr(?:il)?|May|June?|July?|Aug(?:ust)?|Sep(?:t(?:ember)?)?|Oct(?:ober)?|Nov(?:ember)?|Dec(?:ember)?)"


def loose(text):
    """Parse dates such as 2021-03-04, March 4, 2021, 4 March 2021, 3/4/2021, or March 2021."""
    found = iso(text)
    if found:
        return found
    match = re.match(MONTH_NAMES + r"\.?\s+(?:\d{1,2}(?:st|nd|rd|th)?,?\s+)?(\d{4})", text, re.I)
    if not match:
        match = re.match(r"\d{1,2}\s+" + MONTH_NAMES + r"\.?,?\s+(\d{4})", text, re.I)
    if match:
        month = MONTHS.index(match[1][:3].title()) + 1
        if valid(int(match[2]), month):
            return int(match[2]), month
    match = re.match(r"(\d{1,2})/\d{1,2}/(\d{4})", text)
    if match and valid(int(match[2]), int(match[1])):
        return int(match[2]), int(match[1])
    return None


def from_path(url):
    """Dates embedded in a URL path, such as /2018/11/26/post or /files/2024-02/."""
    path = urlsplit(url).path
    match = re.search(r"/((?:19|20)\d{2})[/-](0[1-9]|1[0-2])(?:[/-]|$)", path)
    if match and valid(int(match[1]), int(match[2])):
        return int(match[1]), int(match[2])
    match = re.search(r"/((?:19|20)\d{2})/", path)
    if match and valid(int(match[1])):
        return int(match[1]), 0
    return None


def git_date(path):
    try:
        text = subprocess.run(
            ["git", "log", "-1", "--format=%cs", "--", path],
            check=True, text=True, capture_output=True,
        ).stdout.strip()
    except (OSError, subprocess.CalledProcessError):
        return None
    return iso(text)


def get(url, limit=16_000_000):
    headers = {"User-Agent": AGENT, "Accept-Language": "en"}
    if urlsplit(url).hostname == "api.github.com" and os.environ.get("GITHUB_TOKEN"):
        headers["Authorization"] = f"Bearer {os.environ['GITHUB_TOKEN']}"
    request = Request(url, headers=headers)
    with urlopen(request, timeout=20) as response:
        return response.headers, response.read(limit)


def header_date(headers):
    """Use Last-Modified only from a file server that did not just generate the page.

    GitHub Pages resets Last-Modified on every site deploy, so it says nothing about
    when an individual page changed. The Internet Archive reports the original
    server's headers with an X-Archive-Orig- prefix.
    """
    if headers.get("X-GitHub-Request-Id"):
        return None
    prefix = "X-Archive-Orig-" if headers.get("X-Archive-Orig-Date") else ""
    try:
        modified = parsedate_to_datetime(headers.get(prefix + "Last-Modified"))
        served = headers.get(prefix + "Date")
        served = parsedate_to_datetime(served) if served else today()
    except (TypeError, ValueError):
        return None
    if served - modified < timedelta(days=2):
        return None
    return stamp(modified)


def stated_dates(visible):
    found = []
    for match in re.finditer(r"(?:last\s+)?(?:updated|modified|revised)\s*(?:on|:)?\s*", visible, re.I):
        found.append(loose(visible[match.end():match.end() + 40]))
    return [d for d in found if d]


def plain_text(html):
    return re.sub(r"\s+", " ", re.sub(r"<[^>]+>", " ", html))


def html_date(text):
    """Return (page date, footer date) declared in page metadata or visible text.

    A footer date may be a site-wide build stamp, so callers should prefer a date in
    the URL path over it.
    """
    modified, published = [], []
    for key, value in re.findall(r'"(dateModified|datePublished|uploadDate)"\s*:\s*"([^"]+)"', text):
        (modified if key == "dateModified" else published).append(iso(value))
    for tag in re.findall(r"<meta\b[^>]*>", text, re.I):
        name = re.search(r'(?:name|property|itemprop)\s*=\s*["\']([^"\']+)', tag, re.I)
        content = re.search(r'content\s*=\s*["\']([^"\']+)', tag, re.I)
        if not name or not content:
            continue
        name = name[1].lower()
        if name in {"article:modified_time", "og:updated_time", "last-modified", "dcterms.modified", "datemodified"}:
            modified.append(iso(content[1]))
        elif name in {"article:published_time", "datepublished", "uploaddate", "dcterms.date",
                      "citation_publication_date", "date"}:
            published.append(iso(content[1]))
    text = re.sub(r"(?is)<(script|style)\b.*?</\1>", " ", text)
    footers = re.findall(r"(?is)<footer\b.*?</footer>", text)
    stated = stated_dates(plain_text(re.sub(r"(?is)<footer\b.*?</footer>", " ", text)))
    footer = (stated_dates(plain_text(" ".join(footers))) or [None])[0]
    # Pages often embed metadata for related articles too, so keep the first declared date.
    modified = [d for d in modified if d]
    published = [d for d in published if d]
    if modified:
        return modified[0], footer
    return max(published[:1] + stated[:1], default=None), footer


def pdf_date(data):
    """Modification (or else creation) date from a PDF's info dictionary or XMP metadata."""
    chunks = [data]
    for match in list(re.finditer(rb"stream\r?\n", data))[:400]:
        try:
            chunk = zlib.decompressobj().decompress(data[match.end():match.end() + 400_000], 400_000)
        except zlib.error:
            continue
        if b"Date" in chunk or b"xmp:" in chunk:
            chunks.append(chunk)
    for keys in ((rb"/ModDate", rb"<xmp:ModifyDate>", rb'xmp:ModifyDate="'),
                 (rb"/CreationDate", rb"<xmp:CreateDate>", rb'xmp:CreateDate="')):
        found = []
        for chunk in chunks:
            found += [iso(f"{y.decode()}-{m.decode()}")
                      for y, m in re.findall(re.escape(keys[0]) + rb"\s*\(D:(\d{4})(\d{2})", chunk)]
            for key in keys[1:]:
                found += [iso(v.decode("ascii", "replace"))
                          for v in re.findall(re.escape(key) + rb'\s*(\d{4}-\d{2})', chunk)]
        found = [d for d in found if d]
        if found:
            return max(found)
    return None


def github_date(url):
    parts = urlsplit(url).path.strip("/").split("/")
    if len(parts) < 2:
        return None
    owner, repo = parts[:2]
    api = f"https://api.github.com/repos/{owner}/{repo}/commits?per_page=1"
    if len(parts) > 4 and parts[2] in {"blob", "tree"}:
        api += f"&sha={parts[3]}&path={'/'.join(parts[4:])}"
    try:
        _, data = get(api)
        return iso(json.loads(data)[0]["commit"]["committer"]["date"])
    except (OSError, ValueError, KeyError, IndexError):
        return None


def lookup(url):
    """Return ((year, month), source) for the most recent update of a linked resource."""
    if not re.match(r"https?://", url):
        path = unquote(url.split("#", 1)[0])
        if not path or path.endswith(".md") or not Path(path).exists():
            return None, "internal"
        return git_date(path), "git history"
    for prefix in (OWN_SITE, OWN_REPO):
        if url.startswith(prefix) and Path(url[len(prefix):]).exists():
            return git_date(url[len(prefix):]), "git history"
    host = (urlsplit(url).hostname or "").lower()
    archived = re.match(r"https?://web\.archive\.org/web/(\d{4})(\d{2})\d*/(.+)$", url)
    if archived:
        # Date the original resource, falling back to the snapshot only when nothing else is known.
        fetched = re.sub(r"(/web/\d+)/", r"\1id_/", url, count=1)
        found, source = inspect(fetched, archived[3])
        if found:
            return found, f"archived {source}"
        return iso(f"{archived[1]}-{archived[2]}"), "archive snapshot"
    if host in {"x.com", "twitter.com"}:
        status = re.search(r"/status/(\d+)", url)
        if status:
            moment = datetime.fromtimestamp(((int(status[1]) >> 22) + 1288834974657) / 1000, timezone.utc)
            return stamp(moment), "post id"
    if host == "github.com":
        found = github_date(url)
        if found:
            return found, "git history"
    if host.endswith(".github.io") and re.search(r"\.\w{2,4}$", urlsplit(url).path):
        # GitHub Pages hides per-file dates, so ask the site's repository about the file.
        owner = host.split(".")[0]
        found = github_date(f"https://github.com/{owner}/{host}/blob/HEAD{urlsplit(url).path}")
        if found:
            return found, "git history"
    if host in {"docs.google.com", "www.amazon.com", "amazon.com"}:
        return None, "unsupported"
    return inspect(url, url)


def inspect(url, original):
    """Date a fetched page or PDF; original is the URL whose path may contain a date."""
    try:
        headers, data = get(url)
    except HTTPError as error:
        return None, f"HTTP {error.code}"
    except (OSError, ValueError) as error:
        return None, type(error).__name__
    kind = headers.get_content_type()
    if kind == "application/pdf" or data[:5] == b"%PDF-":
        found = pdf_date(data)
        if found:
            return found, "PDF metadata"
    elif kind in {"text/html", "application/xhtml+xml"}:
        found, footer = html_date(data.decode("utf-8", "replace"))
        if found:
            return found, "page metadata"
        found = from_path(original)
        if found:
            return found, "URL"
        if footer:
            return footer, "page footer"
    found = header_date(headers)
    if found:
        return found, "Last-Modified"
    found = from_path(original)
    return (found, "URL") if found else (None, "none")


def label(date):
    year, month = date
    return f"(updated {MONTHS[month - 1]} {year})" if month else f"(updated {year})"


def parse_label(line):
    match = LABEL.search(line)
    if not match:
        return line, None
    month = MONTHS.index(match[1]) + 1 if match[1] else 0
    return line[:match.start()], (int(match[2]), month)


def bullet_runs(lines):
    """Yield (start, end) indexes of consecutive top-level bullets inside ## sections."""
    start = None
    section = ""
    for index, line in enumerate(lines + [""]):
        if line.startswith("## "):
            section = line[3:].strip()
        if line.startswith("- ") and section and section != "Related guides":
            if start is None:
                start = index
        elif start is not None:
            yield start, index
            start = None


def process(files, check=False, verbose=False):
    documents = {name: Path(name).read_text().split("\n") for name in files}
    urls = sorted({
        url for lines in documents.values() for start, end in bullet_runs(lines)
        for line in lines[start:end] for url in LINK.findall(line)
    })
    with ThreadPoolExecutor(max_workers=12) as pool:
        found = dict(zip(urls, pool.map(lookup, urls)))
    if verbose:
        for url in urls:
            date, source = found[url]
            print(f"{label(date) if date else '(no date)':<22} {source:<18} {url}")
    changed = []
    for name, lines in documents.items():
        original = list(lines)
        for start, end in bullet_runs(lines):
            entries = []
            for position, line in enumerate(lines[start:end]):
                body, current = parse_label(line)
                dates = [found[url][0] for url in LINK.findall(body) if found.get(url, (None,))[0]]
                best = max([d for d in dates + [current] if d], default=None)
                text = f"{body.rstrip()} {label(best)}" if best else body.rstrip()
                entries.append(((-best[0], -best[1]) if best else (1, 0), position, text))
            lines[start:end] = [text for _, _, text in sorted(entries)]
        if lines != original:
            changed.append(name)
            if not check:
                Path(name).write_text("\n".join(lines))
    return changed


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("files", nargs="*", default=list(GUIDES))
    parser.add_argument("--check", action="store_true", help="report files that would change without writing")
    parser.add_argument("--verbose", action="store_true", help="print the date and source found for each link")
    args = parser.parse_args()
    changed = process(args.files, check=args.check, verbose=args.verbose)
    print(("Would update: " if args.check else "Updated: ") + (", ".join(changed) or "nothing"))


if __name__ == "__main__":
    main()
