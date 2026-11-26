# Academic Guide Maintenance Playbook

Use this playbook to update the book’s companion resources and keep the guide useful from graduate admissions through faculty careers. The scope is computer science academia in the United States, with resources from other fields or countries when their perspective transfers or their local context is explicit.

## Place resources by the reader’s next decision

| File | Reader and purpose |
| --- | --- |
| [README.md](README.md) | Book overview, editions, CSPicks, and links to the four guides |
| [prospective-students.md](prospective-students.md) | Build research experience, apply, choose a program or advisor, and assess funding |
| [current-students.md](current-students.md) | Navigate advising and milestones, conduct and communicate research, teach, and plan a career |
| [faculty-applications.md](faculty-applications.md) | Compare faculty tracks, find openings, prepare materials, interview, and negotiate |
| [faculty-resources.md](faculty-resources.md) | Start a faculty position, run a lab, mentor, apply for grants, teach, serve, and prepare for review |

Place a resource where its main audience will look for it. Cross-link to that section when another stage benefits from the same material. Keep a direct link in both guides when it serves a distinct decision in each.

## Find and evaluate resources

1. Inventory the existing links by topic and stage. Look for missing decisions or perspectives, such as comparing teaching and tenure-track roles, planning a dissertation, or setting expectations with lab members.
2. Use [Awesome PhD Advice](https://github.com/pliang279/awesome-phd-advice) as a starting point. For a broad refresh, check the date of the latest README change, page through the [public forks](https://github.com/pliang279/awesome-phd-advice/forks), and compare their README contents with upstream. A newer push can reflect changes elsewhere in the repository. Credit the fork when it contributes a new item and link to the original resource.
3. Search the web for gaps and recent updates. Prefer the author’s copy, a university or professional society, the official funding agency, or the conference organizer. Include firsthand accounts when they add a perspective the official material cannot provide. Use standing index pages for recurring programs and job searches. Label historical examples by year when the date matters.
4. Add a short annotation that names the author or organization and explains when the reader would use the resource. Label materials that apply to a specific institution, discipline, or country. Link to current official requirements for funding, immigration, and institutional policy.
5. Leave out resources whose substantive content is mostly AI-generated. Check author bylines, editorial disclosures, publication history, and evidence of templated production across related pages. Base decisions on provenance and corroborating evidence. Writing style and AI-detector scores alone are insufficient.

## Date and order links

Each bullet ends with the date its source was last updated, such as `(updated Mar 2024)` or `(updated 2016)`. Bullets within a section run from the most recently updated to the oldest, so readers see current material first. Bullets without a known date follow in their existing order.

1. After adding or changing links, run `python3 .github/scripts/link_dates.py --verbose`. The script finds each date, writes the labels, and re-sorts every section except **Related guides**. For a bullet with several links, it uses the most recent date. Run it with `--check` to list files that would change without editing them.
2. The script uses the first available source in this order: Git history for files in this repository, GitHub repositories, and GitHub Pages files; dates stated by the page in metadata or body text, PDF metadata, or an X post ID; a date in the URL path; a "last updated" note in the page footer; and finally the server’s `Last-Modified` header. It ignores `Last-Modified` from GitHub Pages and from servers that generate pages on request. For an Internet Archive link, it dates the archived original and uses the snapshot date only as a fallback.
3. Labels only move forward. A blocked request never removes a date, and a later date replaces an earlier one. To correct a wrong date, edit or delete the label by hand. If the script keeps restoring a wrong later date, add a special case to the script for that host.
4. Do not put update dates in annotations. Keep a year in the annotation only when it identifies an edition, cohort, or event, such as `(2025)` for an application cycle.
5. Review dates that look implausible, such as an old essay shown as updated this month. The usual cause is a site-wide redeploy or a template build stamp, so add a special case for that host to the script. Google Docs, Amazon, and sites that block automated requests stay undated unless you add a date by hand.

## Repair and verify links

1. Check each changed external URL with a request that follows redirects. Inspect the title, PDF, or visible content to confirm the destination still matches the link label. A successful status can lead to a homepage, sign-in prompt, or removed page.
2. When a request is blocked, try the page in a browser or check an indexed copy and the publisher’s site. Record any links that remain unverified. For a moved resource, prefer the new author or institutional URL. For a removed resource, look for a verified archive snapshot and label it as archived. If the original is unrecoverable, document any removal or substitute in the change summary.
3. Check Markdown rendering, table-of-contents anchors, relative file paths, and cross-guide links. Before replacing or deleting an existing list, compare its links against the new destinations and account for redirects, mirrors, and intentional removals. Keep a pointer at an old path when it serves as a useful entry point.
4. Review the diff for duplicate entries and unrelated changes. Summarize the topics added, meaningful link repairs, and verification limits so a future refresh can pick up where this one ended.

## Scheduled link reviews

The [GitHub Actions workflow](.github/workflows/academic-guide-links.yml) is scheduled for Tuesdays and Fridays at 9:23 a.m. Eastern. Claude Haiku 4.5 shortlists new resources from web search, resource indexes, and recent upstream forks. When it finds candidates, the workflow opens a GitHub issue with the shortlist. GPT-5.3-Codex then reviews the retrieved sources against this playbook and the existing guides. The workflow commits approved links, requests a GitHub Pages rebuild, and closes the issue with the outcome. Each run can shortlist up to eight candidates and add up to four links. A final job then runs `link_dates.py` on the default branch. It labels newly added links, refreshes the dates of existing links, re-sorts each section, and commits and publishes any changes.

Use the `check_models` input on a manual run to check Copilot access without publishing anything. Model access requires either the organization’s Copilot CLI policy for GitHub Actions or a repository Actions secret named `ACADEMIC_GUIDE_COPILOT_TOKEN` containing a fine-grained token with the Copilot Requests permission. Issue and repository writes use the built-in GitHub Actions token.
