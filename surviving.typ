// ============================================================================
// Surviving and Owning Your CS PhD
// A Candid Handbook for Current Computer Science PhD Students in the U.S.
// Companion volume to "Demystifying PhD Admissions in Computer Science"
// ============================================================================

#set text(
  lang: "en",
  size: 11.5pt,
)

#set page(
  margin: (x: 1in, y: 1in),
  numbering: "1",
  number-align: center,
)
#set heading(numbering: "1.")
#set par(justify: true, leading: 0.65em)

#set list(indent: 1em, spacing: 0.55em)
#set enum(indent: 1em, spacing: 0.55em)

#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  block(above: 0.5em, below: 1.2em)[
    #text(size: 19pt, weight: "bold", fill: rgb("#1f2937"))[#it]
  ]
}
#show heading.where(level: 2): set block(above: 1.4em, below: 0.8em)
#show heading.where(level: 3): set block(above: 1.1em, below: 0.6em)

#show ref: set text(fill: rgb("#1d4ed8"))
#show link: set text(fill: rgb("#1d4ed8"))
#show link: underline
#show figure.caption: set text(size: 9.5pt, fill: rgb("#374151"))

// Inline code
#show raw.where(block: false): it => box(
  fill: rgb("#f0f0f0"),
  inset: (x: 2.5pt, y: 1pt),
  radius: 2pt,
  text(size: 0.9em, it),
)

// Code / template blocks
#show raw.where(block: true): it => block(
  fill: rgb("#f3f4f6"),
  stroke: (left: 2.5pt + rgb("#9ca3af")),
  inset: 10pt,
  radius: (right: 4pt),
  width: 100%,
  breakable: false,
  text(size: 0.86em, it),
)

// ============================================================================
// Book Metadata
// ============================================================================
#let mytitle = "Surviving and Owning Your CS PhD"
#let mysubtitle = "An Unfiltered Handbook for Current Computer Science PhD Students in the U.S."
#let me = "ThanhVu (Vu) Nguyen"
#let institute = "George Mason University"
#let mybookgithub = "https://github.com/dynaroars/phd-cs-us"
#let demystifyurl = "https://roars.dev/phd-cs-us/demystify.pdf"
#let advisingurl = "https://roars.dev/phd-cs-us/advising.pdf"

// ============================================================================
// Imports: Theorion callouts & Glossarium
// ============================================================================
#import "@preview/theorion:0.6.0": *
#import cosmos.simple: *
#show: show-theorion

#import "@preview/glossarium:0.5.10": make-glossary, register-glossary, print-glossary, gls, glspl, gls-long, Gls
#show: make-glossary

// ============================================================================
// Custom Macros & Signature Book Elements
// ============================================================================
#let alert(txt) = { highlight(fill: red.lighten(35%))[#txt] }

#let paragraph(title, body) = {
  v(0.45em)
  text(weight: "bold", style: "italic")[#highlight(fill: gray.lighten(80%))[#title]]
  h(0.4em)
  body
}

#let simpsons(s) = quote(
  attribution: [#text(size: 0.85em)[*The Simpsons*]],
  block: true,
)[
  #text(style: "italic", size: 0.9em)[#s]
]

#let chapter-opener(hook) = block(above: 0.2em, below: 1.2em, breakable: false)[
  #text(size: 13pt, style: "italic", fill: rgb("#1f2937"))[#hook]
]

// Part divider page
#let part-page(roman, title, blurb) = {
  pagebreak(weak: true)
  v(1fr)
  block(
    width: 100%,
    inset: (x: 16pt, y: 18pt),
    stroke: (left: 4pt + olive),
    fill: rgb("#f8faf5"),
  )[
    #text(size: 12pt, weight: "bold", fill: olive, tracking: 1.2pt)[PART #roman]
    #v(0.4em)
    #text(size: 23pt, weight: "bold", fill: rgb("#111827"))[#title]
    #v(0.7em)
    #text(size: 11pt, style: "italic", fill: rgb("#374151"))[#blurb]
  ]
  v(1.4fr)
}

// Polite academic answer vs. unfiltered reality
#let polite-vs-real(polite, real) = block(
  width: 100%,
  breakable: false,
  above: 0.9em,
  below: 0.9em,
  radius: 4pt,
  stroke: 0.7pt + rgb("#d1d5db"),
  clip: true,
)[
  #block(width: 100%, fill: rgb("#f3f4f6"), inset: (x: 11pt, y: 8pt), below: 0pt)[
    #text(size: 9pt, weight: "bold", fill: rgb("#4b5563"))[The Boring Neutral "Academic" Answer] \
    #text(size: 10pt, style: "italic", fill: rgb("#374151"))[#polite]
  ]
  #block(width: 100%, fill: rgb("#fefce8"), inset: (x: 11pt, y: 9pt), above: 0pt)[
    #text(size: 9pt, weight: "bold", fill: rgb("#92400e"))[The Real Answer] \
    #text(size: 10.5pt, fill: rgb("#111827"))[#real]
  ]
]

// ROARS Lab N=1 box (keeps personal stories clearly labeled)
#let from-roars(title: "From the ROARS Lab", body) = block(
  width: 100%,
  breakable: true,
  above: 0.9em,
  below: 0.9em,
  fill: rgb("#f4f8f0"),
  stroke: (left: 3pt + olive, rest: 0.5pt + rgb("#d4dec9")),
  inset: (x: 12pt, y: 9pt),
  radius: (right: 4pt),
)[
  #text(size: 9.5pt, weight: "bold", fill: olive.darken(25%))[#title]
  #v(0.3em)
  #text(size: 10.5pt)[#body]
]

// Counterpoint box for other advisor styles / subfields
#let other-labs(title: "Different Advisor, Different Lab", body) = block(
  width: 100%,
  breakable: true,
  above: 0.9em,
  below: 0.9em,
  fill: rgb("#f0f5ff"),
  stroke: (left: 3pt + rgb("#2563eb"), rest: 0.5pt + rgb("#cfe0ff")),
  inset: (x: 12pt, y: 9pt),
  radius: (right: 4pt),
)[
  #text(size: 9.5pt, weight: "bold", fill: rgb("#1e40af"))[#title]
  #v(0.3em)
  #text(size: 10.5pt)[#body]
]

// Curated further reading at end of each chapter
#let further-reading(body) = block(
  width: 100%,
  breakable: true,
  above: 1.2em,
  below: 0.6em,
  fill: rgb("#f9fafb"),
  stroke: 0.6pt + rgb("#d1d5db"),
  inset: (x: 12pt, y: 9pt),
  radius: 4pt,
)[
  #text(size: 9.5pt, weight: "bold", fill: rgb("#1f2937"))[Related Resources]
  #v(0.3em)
  #text(size: 10pt)[#body]
]

// ============================================================================
// Lean-style `sorry` review marker.
// Flip `show-sorry` to `false` anytime you want a clean PDF without markers.
// Search for `#sorry` in your editor and delete each one once you have reread
// and rewritten the section in your own words.
// ============================================================================
#let show-sorry = true
#let sorry = if show-sorry {
  h(0.35em)
  box(
    fill: rgb("#fff3cd"),
    stroke: 0.6pt + rgb("#d97706"),
    inset: (x: 3.5pt, y: 1pt),
    radius: 2pt,
    text(fill: rgb("#92400e"), weight: "bold", size: 0.78em, raw("sorry")),
  )
}

// Helper draft banner (preserved from demystify.typ for future revisions)
#let draftbanner(note: "") = block(
  fill: rgb("#fff3cd"),
  inset: 8pt,
  radius: 4pt,
  width: 100%,
  stroke: (paint: rgb("#e0a800"), thickness: 1pt),
)[
  #text(fill: rgb("#856404"), weight: "bold", size: 0.9em)[DRAFT.]
  #if note != "" {
    linebreak()
    text(fill: rgb("#856404"), size: 0.85em, style: "italic")[Note to self: #note]
  }
]

// Simple horizontal bar chart helper (reused from demystify.typ)
#let statbar(data, max: 100, unit: [%]) = align(center, box(width: 88%, grid(
  columns: (auto, 1fr, auto),
  row-gutter: 9pt,
  column-gutter: 8pt,
  align: (right + horizon, left + horizon, left + horizon),
  ..data.map(row => (
    text(size: 0.88em, row.at(0)),
    rect(width: row.at(1) / max * 100%, height: 0.95em, fill: row.at(2), stroke: none, radius: 1.5pt),
    text(size: 0.85em, weight: "bold", [#row.at(1)#unit]),
  )).flatten()
)))

#show figure.where(kind: image): set figure(supplement: [Fig.])
#show figure.where(kind: table): set figure(supplement: [Tab.])
#show heading.where(level: 1): set heading(supplement: [Ch.])
#show heading.where(level: 2): set heading(supplement: [Sec.])
#show heading.where(level: 3): set heading(supplement: [Sec.])

// ============================================================================
// Glossary Entries
// ============================================================================
#let entry-list = (
  (key: "ABD", short: "ABD", long: "All But Dissertation", description: [A PhD candidate who has completed coursework, qualifying exams, and proposal, and only needs to finish and defend the dissertation. Also the easiest place to get stuck forever.]),
  (key: "AC", short: "AC", long: "Area Chair", description: [A senior member of a conference program committee (common in ML/CV venues like NeurIPS, ICML, and CVPR) who oversees a batch of papers, leads reviewer discussions, and writes the meta-review.]),
  (key: "AE", short: "AE", long: "Artifact Evaluation", description: [An optional or required conference process where reviewers try to run your code, data, and scripts to check reproducibility and award ACM badges.]),
  (key: "arxiv", short: "arXiv", long: "arXiv preprint server", description: [An open-access repository where CS researchers post preprints of papers before or alongside peer review.]),
  (key: "camera-ready", short: "camera-ready", description: [The final, polished, formatted version of an accepted paper submitted to the publisher for the conference proceedings.]),
  (key: "candidacy", description: [Formal status granted after passing required coursework, qualifying exams, and often the thesis proposal; makes you a "PhD candidate" rather than just a "PhD student."]),
  (key: "COI", short: "COI", long: "Conflict of Interest", description: [A relationship---such as shared institution, recent co-authorship, or advisor-advisee history---that disqualifies someone from reviewing your paper or grant.]),
  (key: "CPT", short: "CPT", long: "Curricular Practical Training", description: [Work authorization that allows F-1 international students to do off-campus internships related to their degree *before* graduating.]),
  (key: "desk-reject", short: "desk reject", description: [A paper rejected immediately by program chairs without peer review, usually for violating formatting rules, page limits, anonymity, or scope.]),
  (key: "dissertation", short: "dissertation", description: [The book-length original research document (also called a thesis) you write and defend to earn your PhD; in CS it is frequently built around 3--5 related published papers.]),
  (key: "DSO", short: "DSO", long: "Designated School Official", description: [A staff member in your university's international student office authorized to manage your SEVIS record and approve CPT/OPT paperwork.]),
  (key: "first-author", short: "first author", description: [The lead author listed first on a CS paper (except in alphabetical-order subfields like theory). Usually the student who drove the work, built the tool/proof, ran experiments, and drafted the paper.]),
  (key: "GRA", short: "GRA", long: "Graduate Research Assistantship", description: [Funding paid from a professor's grant or lab funds so you can work on research while receiving tuition coverage, health insurance, and a stipend.]),
  (key: "GTA", short: "GTA", long: "Graduate Teaching Assistantship", description: [Department funding where you help teach a course (grading, office hours, recitations) in exchange for tuition, health insurance, and a stipend.]),
  (key: "IDP", short: "IDP", long: "Individual Development Plan", description: [A structured document you fill out with your advisor to align on research milestones, skills, and post-PhD career goals.]),
  (key: "meta-review", short: "meta-review", description: [A synthesis written by an Area Chair or PC chair summarizing individual reviews, rebuttal discussions, and the rationale for the final accept/reject decision.]),
  (key: "NIER", short: "NIER", long: "New Ideas and Emerging Results", description: [A short-paper track (e.g., at ICSE) designed for bold early ideas that do not yet have a full-scale evaluation.]),
  (key: "OPT", short: "OPT", long: "Optional Practical Training", description: [Post-graduation work authorization (12 months standard) for F-1 students to work in the U.S. in their field of study.]),
  (key: "ORCID", short: "ORCID", long: "Open Researcher and Contributor ID", description: [A persistent digital identifier that keeps your papers attached to you even if you share a common name or change institutions.]),
  (key: "PC", short: "PC", long: "Program Committee", description: [The group of researchers who review submissions and select papers for a CS conference.]),
  (key: "PI", short: "PI", long: "Principal Investigator", description: [The lead faculty member on a research grant. In day-to-day CS conversation, just say "advisor" rather than "PI."]),
  (key: "postdoc", short: "postdoc", long: "postdoctoral researcher", description: [A temporary, typically 1--2 year research position taken after the PhD to deepen a publication record, switch subfields, or prepare for the faculty market.]),
  (key: "preprint", description: [A publicly posted manuscript (usually on arXiv) that has not yet completed formal peer review.]),
  (key: "proposal", short: "proposal", long: "dissertation proposal", description: [A formal document and oral presentation defending your plan for the remaining work needed to complete your dissertation.]),
  (key: "quals", short: "quals", long: "qualifying exam", description: [An early-PhD milestone (written exam, oral exam, or research paper/presentation depending on the department) that gates your progression toward candidacy.]),
  (key: "RCR", short: "RCR", long: "Responsible Conduct of Research", description: [Formal ethics training and standards covering data integrity, authorship, plagiarism, human subjects, and conflicts of interest.]),
  (key: "rebuttal", description: [A short written response (typically 500--1,000 words or one page) where authors answer reviewer questions and clarify misunderstandings before final decisions are made.]),
  (key: "R&R", short: "R&R", long: "Revise and Resubmit (Major/Minor Revision)", description: [A journal or hybrid-conference decision saying your paper is not rejected, but must address specific reviewer concerns before acceptance.]),
  (key: "shadow-pc", short: "Shadow PC", long: "Shadow Program Committee", description: [A parallel, training-focused review committee run by some CS conferences so PhD students can practice reviewing real submissions under senior mentorship.]),
  (key: "shepherd", description: [A PC member assigned to verify that an accepted (or conditionally accepted) paper actually incorporates the mandatory revisions requested during review.]),
  (key: "STEM-OPT", short: "STEM OPT", long: "STEM OPT Extension", description: [A 24-month extension to standard OPT available to eligible F-1 graduates in STEM fields (including CS) working for E-Verify employers, totaling up to 36 months.]),
  (key: "sub-reviewer", short: "sub-reviewer", description: [An external reviewer invited by an assigned PC member (often their senior PhD student) to help review a paper. Ethical venues require declaring sub-reviewers in the system.]),
  (key: "tenure-track", short: "tenure-track", description: [A research-university professor position (starting as Assistant Professor) evaluated after roughly 6 years for permanent tenure.]),
  (key: "toptier", short: "top-tier venues", long: "top-tier conferences and journals", description: [The flagship peer-reviewed publication venues in a CS subfield (e.g., ICSE, FSE, PLDI, OOPSLA, CAV, NeurIPS, ICML, CVPR, SOSP, OSDI, CCS, STOC/FOCS).]),
)

#register-glossary(entry-list)

// ============================================================================
// Title Page
// ============================================================================
#set page(numbering: none)

#align(center)[
  #box(
    stroke: (x: 3pt + olive, y: 3pt + olive),
    inset: 0.85in,
    width: 100%,
    height: 100%,
  )[
    #v(0.4fr)
    #text(size: 25pt, weight: "bold", fill: rgb("#111827"))[#mytitle]
    #v(0.7em)
    #text(size: 13.5pt, weight: "semibold", fill: rgb("#374151"))[#mysubtitle]
    #v(1fr)
    #image("files/angelfish3.jpg", width: 52%)
    #v(1fr)
    #text(size: 17pt, weight: "bold", fill: rgb("#111827"))[#me]
    #v(0.25em)
    #text(size: 13pt, fill: rgb("#4b5563"))[#institute]
    #v(0.3em)
    #text(size: 10pt, fill: rgb("#6b7280"))[Companion to _Demystifying PhD Admissions in Computer Science_]
    #v(0.3fr)
  ]
]

#pagebreak()

// ============================================================================
// Colophon / Open-Source Note
// ============================================================================
#set page(numbering: "i")
#counter(page).update(1)

#v(1fr)

The goal of this book is the same as my admissions book, #link(demystifyurl)[_Demystifying PhD Admissions in Computer Science_]: to pull back the curtain on U.S. Computer Science PhD programs and tell students how things _actually_ work---without the polite academic boilerplate.

Too many PhD students spend their first two or three years guessing the unwritten rules: worrying about grades nobody looks at, reading fifty papers instead of building a prototype, hiding half-baked ideas because they're terrified of getting scooped, or taking reviewer hostility personally. Students with well-connected mentors eventually learn these rules over hallway chats. Everyone else learns them the hard way.

That is why this book is *free and open-source* at #link(mybookgithub)[#mybookgithub].

The angelfish on the cover is a nod to my aquarium at home (and to O'Reilly animal covers). Angelfish are stubborn, resilient, and thrive in conditions that wipe out flashier fish---pretty much what it takes to finish a CS PhD.

#v(1.2em)
#emph-block[
  This #link(mybookgithub)[work] © #datetime.today().year() by #me is licensed under CC BY-NC 4.0. To view a copy of this license, visit #link("https://creativecommons.org/licenses/by-nc/4.0/")[creativecommons.org].
]

#pagebreak()

// ============================================================================
// Table of Contents
// ============================================================================
#outline(title: "Contents", depth: 2)

#pagebreak()

// ============================================================================
// Preface
// ============================================================================
#heading(numbering: none)[Preface]

Getting admitted into a CS PhD program is hard, so first of all, congratulations on making it in.
That said, admissions is actually the straightforward part: you had fixed deadlines, a list of documents to upload, and a clear yes-or-no decision.

The PhD itself is much messier.
There is no syllabus for becoming a researcher, the milestones are vague, grades stop mattering almost immediately, and every advisor has their own quirks and expectations.

Earlier, I wrote #link(demystifyurl)[_Demystifying PhD Admissions in Computer Science_] to explain how admissions work, and I wrote the #link(advisingurl)[_ROARS Lab Advising Guide_] so my own students would know what they were getting into before joining my lab.
Still, every year I see current PhD students---in my group and elsewhere---run into the same avoidable problems:

- Spending their first year chasing a 4.0 GPA while making no progress in research.
- Reading papers for six months and convincing themselves every good idea is already taken.
- Waiting for their advisor to assign weekly tasks, or hiding a new idea because they think their advisor will shoot it down.
- Panicking over bad reviews, playing "find the champion and defector" during rebuttals, or submitting half-baked papers "just to get feedback."
- Either avoiding AI tools completely, or using them blindly without understanding the code or rewriting the generic AI prose.
- Taking a full-time industry job while #gls("ABD") and never finishing their dissertation.

There are already plenty of good essays on grad school (we collect the best ones in #link("https://github.com/dynaroars/phd-cs-us/blob/main/current-students.md")[our companion resource list] and at the end of each chapter).
Most of those classics were written between 1986 and 2019, though---before LLMs changed how we write code and papers, before big CS conferences grew to thousands of submissions with noisy reviewing, and before Discord and open-source GitHub repos became standard lab life.
So this book is my attempt to put down practical, current advice for PhD students in U.S. CS programs.

#paragraph[Note on Tone (and My Bias)][
  If you have read my #link(advisingurl)[advising guide], you already know my style: this book is *blunt, subjective, and opinionated* (see the #link(<sec:disclaimer>)[Disclaimer]).
  Overly polite, neutral academic advice usually hedges so much that it isn't actually useful when you need to make a decision.

  At the same time, my view comes from my own background: I am a tenured CS professor in Software Engineering, Programming Languages, Formal Methods, and ML Verification; I am a hands-off advisor; and I was a first-generation PhD student at UNM and a postdoc at UMD.
  When something is specifically how we do things in my lab, I put it in a *From the ROARS Lab* box.
  When other advisors or subfields (e.g., hands-on pre-tenure faculty, theory groups, or big systems labs) legitimately work differently, I call that out in a *Different Advisor, Different Lab* box.
]

#paragraph[How to Use This Book][
  You don't need to read this from start to finish. Jump to whatever you are dealing with right now:
  - *Just started?* Read @ch:unwritten-game, @ch:advisor, and @ch:break-first.
  - *Working on a paper or dealing with reviews?* Jump to @ch:writing and @ch:rebuttals.
  - *Figuring out how to use AI responsibly?* Go to @ch:ai-research.
  - *Preparing for quals, your dissertation, or graduation?* Check @ch:quals, @ch:dissertation, and @ch:careers.
  - *Need an email or rebuttal template?* See @app:templates.
] #sorry

// ============================================================================
// Main Matter
// ============================================================================
#set page(numbering: "1")
#counter(page).update(1)

// ============================================================================
// PART I
// ============================================================================
#part-page(
  "I",
  "Settling In & Surviving the First Year",
  "Unlearning undergrad habits, figuring out how to work with your advisor, and finding your footing in the lab.",
)

// ----------------------------------------------------------------------------
// CHAPTER 1
// ----------------------------------------------------------------------------
= The Unwritten Rules of a CS PhD <ch:unwritten-game>

#chapter-opener([A PhD is not "undergrad, harder edition." The sooner you drop undergraduate habits, the sooner your PhD actually starts.])

#simpsons[Trying is the first step towards failure.]

Most first-year PhD students show up with the same problem: they were very good at being undergraduates.
They know how to read a syllabus, chase an A, follow a grading rubric, and wait for the professor to hand out the next assignment.
Those habits got you admitted, but they will actually hurt you in a PhD if you don't let go of them early.

== What a CS PhD Actually Is

In undergrad and most MS programs, you are learning things that other people already solved.
Someone knows the answer, designed the homework so it's doable in a week, and grades you on getting it right.

In a PhD, you are training to become a researcher who produces *new* knowledge.
Nobody has the answer key, and half the time your advisor isn't even sure the problem has a clean solution (or whether it's the right problem to work on).
Matt Might's two-minute #link("https://matt.might.net/articles/phd-school-in-pictures/")[_Illustrated Guide to a PhD_] shows this better than any university handbook: your job is to push a tiny bump into the boundary of human knowledge.

#polite-vs-real(
  [A PhD program provides structured coursework and mentored research culminating in an original doctoral dissertation over approximately five years.],
  [A PhD is a 5--7 year apprenticeship in becoming an independent researcher. Nobody is going to push you to finish. Roughly a third of STEM PhD students never graduate---usually not because they aren't smart enough, but because they keep waiting for someone to tell them what to do.],
)

To calibrate your expectations early:
- The #link("https://ncses.nsf.gov/surveys/earned-doctorates/2024")[NSF Survey of Earned Doctorates] and CRA data put the median time-to-degree in computing closer to *6--7+ years* from the start of grad school (especially if you do internships or pick up an MS along the way). Five years is doable, not automatic.
- The #link("https://cgsnet.org/project/minority-attrition-and-completion-in-stem-doctoral-programs")[Council of Graduate Schools] reports 10-year STEM PhD completion rates around *55--65%*. Some people leave for good reasons (a great job offer, or realizing they don't like research), and others leave for avoidable ones (bad advisor fit, drifting for years without a project, burnout).

I mention those numbers not to scare you, but so you take ownership of your PhD from Day 1 instead of assuming the department will carry you to graduation. #sorry

== The 4.0 GPA Trap <sec:gpa-trap>

Nobody cares about your PhD GPA.

Obviously, don't fail your classes and get put on academic probation.
Most CS departments require something like a 3.0 or 3.2 minimum GPA to stay in good standing and keep your assistantship.
Meet that bar comfortably and pass your required courses.

Beyond that, a 4.0 GPA buys you almost nothing.
When you apply for research internships, postdocs, industry research jobs, or faculty positions later, nobody is going to compare your 3.95 against someone else's 3.60.
They will look at your papers, your code and tools, your letters of recommendation, and your talk.

#from-roars(title: "From the ROARS Lab: Why a 4.0 Makes Me Suspicious")[
  In my advising guide, I say this plainly: *if you are my PhD student and you get a 4.0 GPA in your classes, I might question why you are spending so much time on coursework instead of research.*

  I rarely ask about coursework or grades from my PhD students.
  In fact, if a student is doing great in classes while struggling in research, I take that as a warning sign---they may be using coursework as a way of coping because classes feel structured and familiar, whereas research feels messy.
  Just do enough to get through coursework cleanly and focus on research.
]

#paragraph[How to Use Courses Practically][
  Treat courses as useful tools rather than grades to polish:
  + *Turn course projects into research.* Whenever a grad seminar has an open-ended final project, align it with your lab's research. Talk to both the instructor and your advisor early so you aren't spending a semester on a throwaway toy.
  + *Meet future collaborators and committee members.* Taking a class from a professor outside your lab is an easy way for them to see how you work---and later ask them to sit on your #gls("quals") or #gls("dissertation") committee.
  + *Audit once your required credits are done.* Sitting in on a math, ML, or systems seminar without doing the homeworks gives you most of the value for a fraction of the time.
]

#other-labs[
  Some departments tie your #gls("quals") directly to getting A's or A-'s in specific core breadth courses (e.g., algorithms, systems, AI). Check your department's PhD handbook in Week 1 so you know which courses actually have grade cutoffs and which ones just need a B.
] #sorry

== The 5-Year Map (So You Don't Drift)

Every CS department has slightly different acronyms and deadlines (for concrete examples, compare #link("https://www.eecs.mit.edu/academics/graduate-programs/materials-and-forms-for-graduate-students/phd-academic-progress-i/")[MIT EECS's Road to the PhD] and #link("https://eecs.berkeley.edu/timeline/")[Berkeley EECS's timeline]), but most U.S. CS PhD programs follow the same rough timeline (@tab:timeline).

#figure(
  table(
    columns: (auto, 1.3fr, 1.5fr),
    inset: 7pt,
    align: left,
    fill: (x, y) => if y == 0 { rgb("#e5e7eb") } else if calc.odd(y) { rgb("#f9fafb") },
    stroke: 0.5pt + rgb("#d1d5db"),
    [*Phase*], [*What the Department Sees*], [*What Actually Matters*],
    [Years 1--2],
    [Core coursework, finding/confirming advisor, #gls("quals")],
    [Getting into your area, shipping your first co-authored or first-author submission, confirming advisor fit],
    [Years 2--3],
    [Finish classes, pass quals, pick up optional MS, maybe first internship],
    [Publishing first-author papers at #gls("toptier"), taking ownership of your own problem],
    [Years 3--4],
    [Form committee, pass #gls("proposal"), reach #gls("candidacy")],
    [Knowing your topic better than your advisor, internships, networking, reviewing],
    [Years 5--6+],
    [Write #gls("dissertation"), defend, file paperwork],
    [Publishing independently without heavy advisor edits, job market (industry, postdoc, or faculty), graduating cleanly without getting stuck #gls("ABD")],
  ),
  caption: [What the university bureaucracy tracks versus what actually determines whether you graduate on time with strong options.],
) <tab:timeline>

Note the main trap in Years 1 and 2: classes keep you busy, so it is very easy to wake up at the end of Year 2 with zero paper submissions.
In my lab, by the end of Year 2 I expect you to have published at least a second-author paper (and you are doing well if you already have a first-author paper).
By the end of Year 3, you are behind if you haven't published a first-author paper---and seriously behind if you haven't made any good submissions yet.
If you hit that point, stop and have a blunt conversation with your advisor about what is blocking you. #sorry

== Practical Admin (Do This in Month 1)

Before research eats all your time, spend two hours learning your university's basic rules so you aren't caught off guard later:

- *Read your Graduate Handbook once.* Check the exact credit requirements, #gls("quals") deadlines, #gls("GTA")/#gls("GRA") funding limits, and continuous enrollment rules. Don't rely on hallway rumors from older students---policies change.
- *Know how your funding works.* Is summer covered? Who pays mandatory student fees (many "full tuition waivers" still leave you paying \$500--\$1,500/semester in fees)? If your advisor's grant ends, does the department cover you with a #gls("GTA")? Look at #link("https://gradschool.cornell.edu/financial-support/graduate-funding-and-enrollment/")[Cornell's graduate funding guide] for the right questions to ask your graduate coordinator.
- *Know your safety nets before you need them.* Most U.S. universities have formal policies for #link("https://gradschool.cornell.edu/policies/leaves-of-absence/")[leaves of absence] (medical, family, personal), #link("https://gradschool.cornell.edu/policies/disability-policies/")[disability accommodations], neutral #link("https://gradschool.cornell.edu/policies/advocacy-services/")[student advocacy / ombuds offices], and counseling (like #link("https://doingwell.mit.edu/support-3/")[MIT's DoingWell]). Look up your campus equivalents now while things are calm.
- *Don't repeat what is already in PhD Demystify.* If you are new to the U.S. and still figuring out how to address professors, taxes, credit cards, health insurance, tipping, or academic integrity rules, check the *Academic and Cultural Differences* and *Practical Finances* chapters in #link(demystifyurl)[_Demystifying PhD Admissions in Computer Science_]. One rule is worth repeating anyway: *never* install cracked/pirated software on university machines, and *never* take unauthorized off-campus work on an F-1 visa. #sorry

#further-reading[
  - #link("https://matt.might.net/articles/phd-school-in-pictures/")[The Illustrated Guide to a PhD] (Matt Might) --- Two minutes of drawings that capture what a PhD actually contributes.
  - #link("https://karpathy.github.io/2016/09/07/phd/")[A Survival Guide to a PhD] (Andrej Karpathy) --- Still one of the sharpest, most practical overviews of CS PhD reality.
  - #link("https://utstat.toronto.edu/reid/sta2212s/2023/WittenGradTips.pdf")[Ten tips for PhD students] (Daniela Witten) --- Short, punchy, and refreshingly honest about prioritizing research over grades.
  - #link("https://www.cs.jhu.edu/~mdredze/publications/HowtoBeaSuccessfulPhDStudent.pdf")[How to Be a Successful PhD Student] (Mark Dredze & Hanna Wallach) --- A solid CS-specific roadmap of milestones and habits.
]

// ----------------------------------------------------------------------------
// CHAPTER 2
// ----------------------------------------------------------------------------
= Your Advisor: Fit, Expectations, and Managing Up <ch:advisor>

#chapter-opener([Your advisor is not your boss, not your parent, and not your therapist---they are your main research partner, and learning how to work with them matters more than your school's ranking.])

#simpsons[I'm normally not a praying man, but if you're up there, please save me, Superman.]

Ask PhD graduates what mattered most during their degree and almost everyone will give the same answer: their advisor---not the university ranking, the stipend, or the city.
Your advisor shapes your research direction, pays your #gls("GRA"), edits your early papers, connects you with collaborators, signs your dissertation, and writes the main letter of recommendation for your next job.
Still, most students treat the advisor relationship passively instead of managing it deliberately.

== Know What Kind of Advisor You Actually Have

Faculty advising styles vary a lot, and most professors don't write an advising guide spelling out how they operate.
Pay attention during your first semester to where your advisor sits on four dimensions:

+ *Hands-on vs. Hands-off.* A hands-on advisor meets frequently, suggests specific experiments, and follows technical details closely. A hands-off advisor suggests broad directions, expects you to be independent, and mainly steps in when you are genuinely stuck or close to a deadline. Neither style is inherently better---a bad match is what causes trouble. An independent student will feel micromanaged by a hands-on advisor, while a student who wants frequent hand-holding will struggle under a hands-off one.
+ *Pre-tenure vs. Tenured.* An assistant professor without tenure is on a six-year clock. They are often very responsive and technically hands-on, which can be great for students, though publish-or-perish pressure can sometimes spill onto the group. A tenured professor has more freedom to take risks and ignore paper-counting pressure (that's certainly true for me), though some tenured faculty also get busy with administration or committees.
+ *Funding source constraints.* NSF grants and unrestricted industry gifts give you broad research freedom. Certain DoD or industry *contract* projects come with fixed deliverables, progress reports, and engineering integration work that don't always turn into papers. Know what grant is paying your #gls("GRA") and what obligations come with it.
+ *Sole advisor vs. Co-advising.* Co-advising worked out fine for me during my own PhD with Stephanie Forrest and Deepak Kapur, so it can certainly work. That said, co-advising can also get messy if the two advisors disagree on what you should do, expect twice as many meetings, or each assume the other one is funding you or reading your draft. In my own lab, I prefer to be a student's main or sole advisor and have other faculty act as collaborators---that way you get mentoring from multiple experts without conflicting authority.

#figure(
  image("files/profs-time.jpeg", width: 58%),
  caption: [A surprisingly accurate translation table for advisor time estimates. Source: #link("https://phdcomics.com")[PhD Comics] (© Jorge Cham).],
) <fig:profs-time> #sorry

== How Professors Actually Allocate Attention <sec:managing-up>

One thing that surprises many new students: *professors do not spend equal time with all their students.*

#polite-vs-real(
  [I mentor all members of my research group equitably and support every student's individual intellectual growth.],
  [I spend much more time with students who get me excited and involved in their work by showing concrete progress and results. If you come to meetings every week just talking about new ideas (or changing them constantly) with nothing to show, my attention naturally goes to the student who just sent me interesting results.],
)

That isn't personal favoritism; it is just how limited time works when someone is juggling classes, grants, reviewing, committees, and family.
Attention follows momentum.
If you want your advisor actively engaged in your research, make it easy for them:

- *Show results, not just talk.* Don't walk into a 1:1 saying, *"I've been thinking about X and reading some papers, what should I do next?"* Bring concrete numbers or a short doc: *"I tried X and Y. X failed because of Z. Y beat the baseline by 12% on three benchmarks, though it timed out on benchmark 4. Next week I plan to try fix W---does that sound reasonable?"*
- *Send a short update before meetings.* Even three bullet points on Discord/Slack or email the night before turns a meandering chat into a useful technical discussion.
- *Follow up without waiting to be asked.* Professors forget things constantly. If your advisor said they would email Prof. X or read Section 3 by Friday and didn't, send a quick, direct reminder on Monday morning. You are helping them, not annoying them.
- *Keep commitments, and say "no" early.* If your advisor asks, *"Can you finish these experiments by Friday?"* and you know that isn't realistic, say so upfront (*"I can finish A and B by Friday and C by Monday"*). Saying yes and then disappearing on Friday breaks trust fast. #sorry

== Pitching Unconventional Ideas and Disagreeing

Students---especially those from hierarchical academic cultures---often assume they should agree with everything their advisor says, or ask permission before trying a side idea.

Don't do that. Advisors are wrong all the time; you are much closer to the code, the data, and the edge cases than we are.

#from-roars(title: "From the ROARS Lab: Don't Tell Me About Your Secret Idea Yet")[
  I tell my students this explicitly: *if you come up with an idea that is quite different from what you're working on, do not tell me about it yet*---especially if you don't have concrete results to back it up---because I will likely shoot it down.

  Instead, keep working on your main project, and on the side quietly build a *prototype* and get some *good results*. If you show me concrete evidence that your idea works, I will be much more open to it. This has happened multiple times in my lab, and some of my students are probably working on secret ideas right now that I don't know about yet!

  The same thing applies when we disagree. If I tell you to try *X*, and you think *Y* is better, don't just argue about it---and don't silently ignore *X*. Do *both* *X* and *Y* and show me both results. It doesn't matter to me whether *X* or *Y* turns out better; what matters is that you believe in your idea and can back it up with results.
]

#other-labs[
  If you work in a hardware lab or an ML group where a single experiment costs thousands of dollars in GPU compute, obviously don't burn shared grant compute on a secret side project without asking. The "prototype first" rule is for cheap, small-scale sanity checks before you ask for big resources.
] #sorry

== Setting Expectations Explicitly (Don't Guess)

Most advisor-student conflicts come from unspoken assumptions rather than bad intentions.
You assumed weekly 1:1s; your advisor assumed you would message them on Discord whenever you needed help.
You assumed taking two weeks off in December was fine; your advisor was planning a January submission.

Have a direct expectation-setting conversation in your first semester (and revisit it once a year).
You can use a short shared doc based on Eugene Vinitsky's #link("https://www.eugenevinitsky.com/posts/expectation-setting/")[expectation-setting guide] or #link("https://rackham.umich.edu/faculty-and-staff/resources-for-directors/mentoring/")[Michigan Rackham's mentoring templates] (see @app:templates for a short agenda). Cover:

+ *Communication:* Email vs. Slack/Discord? Expected response time? Do late-night messages mean "reply now" or just "I work late, reply when you see it"?
+ *Meetings:* Weekly 1:1s, group meetings, or ad-hoc? Who sets the agenda?
+ *Progress expectations:* What counts as "on track" at the end of Year 1, Year 2, Year 3? How many submissions per year are expected?
+ *Authorship & collaboration:* How is author order decided? Is collaborating outside the lab encouraged?
+ *Internships & time off:* When are summer internships encouraged? How much notice is expected for vacations?
+ *Feedback style:* Do you prefer direct written edits or verbal walkthroughs? If you're falling behind, will they tell you early so there are no surprises?

#tip-block[
  A very revealing question to ask your advisor (and senior labmates) early: *"How do you know when one of your students is ready to graduate?"* Their answer tells you what actually counts in that lab.
] #sorry

== Outgrowing Your Advisor (The Goal, Not a Problem)

Around Year 3 or 4, you will ask your advisor a deep technical question about your topic and realize *they don't know the answer---and you actually know more about this area than they do.*

New students sometimes worry when this happens (*"Wait, is my advisor not expert enough?"*).
In fact, that is the whole point of a PhD.

In my lab, I *expect* my students to outgrow my expertise in their topic.
When that happens, my job shifts to critiquing your arguments, helping with framing and writing, introducing you to external experts (e.g., Hai works with Matt Dwyer at UVA on NeuralSAT, and KimHao worked with Quoc-Sang at Facebook on build systems), and helping you land a good job.
In short, if you become better than your advisor in your area, they've done their job and you are getting close to graduating. #sorry

#further-reading[
  - #link("https://roars.dev/phd-cs-us/advising.pdf")[ROARS Lab Advising Guide] (ThanhVu Nguyen) --- One concrete, unfiltered example of a professor answering the hard advising questions upfront.
  - #link("https://www.eugenevinitsky.com/posts/expectation-setting/")[Expectation setting] (Eugene Vinitsky) --- Practical framework for aligning working arrangements with your advisor before friction builds.
  - #link("https://rackham.umich.edu/faculty-and-staff/resources-for-directors/mentoring/")[Mentoring guides & shared-expectations templates] (Michigan Rackham) --- Concrete worksheets you can bring to a semester check-in.
  - #link("https://grad.umn.edu/academic-career-support/individual-development-plan")[Individual Development Plan (IDP)] (Univ. of Minnesota) --- Useful once a year to make sure your PhD connects to your actual career goals.
]

// ----------------------------------------------------------------------------
// CHAPTER 3
// ----------------------------------------------------------------------------
= Lab Culture, Mental Health, and Switching Advisors <ch:lab-life>

#chapter-opener([A lonely PhD is much harder than a collaborative one. Talk to your labmates, protect your sanity, and remember that switching advisors is normal---not a personal failure.])

#simpsons[To alcohol! The cause of---and solution to---all of life's problems.]

Most grad-school guides focus only on the advisor and forget the people sitting next to you.
In reality, *your labmates and cohort are often better day-to-day resources to learn from than your advisor.*

== Your Labmates Are Your Real Daily Mentors

Your advisor is good at high-level research direction and paper framing; your third-year labmate knows why the university cluster throws a weird CUDA error at 2 AM, which benchmark scripts are broken, which seminar professor grades harshly, and how to read your advisor's feedback.

A few habits make your lab life much better:
- *Speak up in weekly lab meetings.* Don't sit silently in the back corner checking email. In our group, we meet weekly on Thursday afternoons using a format inspired by the #link("https://mwhicks1.github.io/papers/score.pdf")[SCRUM/SCORE method] from UMD's PLUM Lab: everyone gives a ~5-minute status update (what they did last week, what's next, where they're stuck), and then someone goes deep on a problem on the whiteboard or presents results. Even the self-identified introverts in our lab are very active in these meetings because everyone's ideas are respected.
- *Help each other out.* Read a labmate's draft before a deadline, share plotting scripts, or help debug an environment bug. Labs are not zero-sum---when your group builds a reputation for strong tools and papers, it helps *everyone* when they go on the job market.
- *Show up in person enough to know people.* Remote work is fine for deep coding, but useful whiteboard discussions rarely happen over scheduled Zoom links. Come into the lab a few days a week (in fact, many schools require ~3 days/week anyway to keep office space), grab lunch together, and attend department events.

#from-roars(title: "From the ROARS Lab: Deadlines, Lazy Days, and Thanksgiving")[
  Work-life balance in CS research is strange---it is rarely a neat 9-to-5. During paper deadlines, we work very hard and long hours (and I often stay up late, 10 PM--1 AM after my kids go to bed, to work with students on Discord or Zoom).

  Outside of deadlines, though, academia gives you a lot of freedom. Feeling lazy and want to take several days off? No problem. I don't care, and you don't even have to tell me (in fact, I tell my students *not* to tell me!). Creativity comes from freedom and flexibility.

  We also make time to have fun together, mostly involving food: group dinners twice a semester, bowling and arcade nights at Round One with other labs, and our annual Thanksgiving dinner at my house for the lab and their families (one year I found out Linhan is a great cook, so I appointed him our "turkey czar" in charge of roasting a 20+ lb turkey for 30 people). When I was a grad student, I mostly stole leftover pizza from other labs---having a real lab community is much better.
] #sorry

== Imposter Syndrome, Burnout, and the Long Middle

Almost every PhD student struggles at some point, usually somewhere between Year 2 and Year 4. It tends to show up in three ways:

+ *Imposter syndrome:* You read a polished NeurIPS or PLDI paper and assume everyone else is a genius while admissions made a mistake letting you in. What you don't see are the two years of dead ends, messy code, and prior rejections behind that 10-page PDF. Even tenured professors feel this way sometimes.
+ *The middle slump:* Classes are done, graduation still feels far away, your experiments aren't beating the baseline yet, and your undergrad friends are buying houses on Big Tech salaries.
+ *Fake work:* You are too tired to think, so you sit at your desk for 11 hours refreshing social media, tweaking LaTeX margins, and feeling guilty---getting neither real research *nor* real rest.

A few practical rules that help:
- *Work in focused blocks, then actually stop.* Four focused hours beat twelve distracted hours. When you are done for the day or weekend, step away without guilt.
- *Have something in your life outside the PhD.* Sports, chess, cooking, hiking, music, family, volunteering---something where your mood does not depend on whether Reviewer #2 liked Lemma 3.
- *Stop comparing your messy draft to other people's CVs.* Compare yourself to where you were six months ago, not to LinkedIn posts.
- *Use campus counseling or medical help early.* If you can't sleep, feel burned out for weeks, or feel hopeless, go talk to your campus counseling center or a doctor. No paper deadline is worth wrecking your health. #sorry

== When (and How) to Switch Advisors <sec:switching-advisors>

Students whisper about switching advisors like it is some shameful secret, so let me state it plainly: *switching advisors is common in U.S. CS academia, and it is much better than spending five miserable years in the wrong lab.*

It almost happened to me during my own PhD when my interests shifted from evolutionary computing to software engineering and formal methods, and several great students in my current lab came to me after switching from other advisors.

#paragraph[Good Reasons to Switch][
  - *Your research interests changed:* You genuinely want to work on systems or ML theory, and your advisor doesn't work in or care about that area. (In that case, a good advisor will tell you to switch---I explicitly tell my students I'd rather they find someone who can actually guide their new topic.)
  - *Bad advising style fit:* You need regular structure and your advisor disappears for months; or you want independence and your advisor micromanages everything.
  - *Broken funding promises:* Your advisor keeps promising a #gls("GRA") that never happens while still demanding full-time lab deliverables on top of heavy #gls("GTA") duties.
  - *Toxic or abusive behavior:* Yelling, humiliation, taking unfair credit, holding back graduation for cheap labor, discrimination, or harassment. Don't try to "fix" an abusive advisor---leave.
]

#caution-block[
  *Don't confuse a normal rough month with a broken advisor.* Before switching over a stressful deadline or tough draft edits, ask yourself if you have actually communicated what you need. Have one honest conversation about expectations first---unless the problem is abuse or retaliation, in which case go straight to your Graduate Program Director, Department Chair, or campus ombuds.
]

#paragraph[How to Switch Cleanly][
  Switching takes a bit of diplomacy, especially for international students whose funding and visa depend on continuous enrollment:
  + *Scout quietly first.* Take a class with, attend lab meetings of, or talk informally with 2--3 potential new advisors. Confirm both (a) they want to take you and (b) there is a funding plan (#gls("GRA") or #gls("GTA")).
  + *Talk to your Graduate Program Director (GPD).* Many schools have formal transition support (see #link("https://rackham.umich.edu/about/directory/graduate-student-and-program-consultation-services/transitional-support-for-change-of-advisors/")[Michigan Rackham's guide] for an example). Handling advisor changes is part of the GPD's job.
  + *Hand off cleanly.* Document your code and experiments, leave repos clean, and agree in writing on authorship for any papers already in progress.
  + *Keep the framing about research fit, not personal blame.* A short, polite explanation---*"My interests have shifted toward X, and Prof. Y's group is a closer match for my dissertation"*---keeps things professional (see @app:templates for a sample email). Good faculty don't hold grudges over honest switches; keeping an unhappy student in a lab helps nobody.
] #sorry

#further-reading[
  - #link("https://www.cs.unc.edu/~azuma/hitch4.html")[So Long, and Thanks for the PhD] (Ronald T. Azuma) --- Classic candid look at navigating advisor dynamics and the emotional arc of grad school.
  - #link("https://rackham.umich.edu/about/directory/graduate-student-and-program-consultation-services/transitional-support-for-change-of-advisors/")[Support when changing advisors] (Michigan Rackham) --- A concrete blueprint for what a healthy departmental transition looks like.
  - #link("https://www.cs.utexas.edu/~dahlin/bookshelf/timetalk.htm")[Time Management] (Randy Pausch) --- Old talk, still undefeated on cutting fake work and protecting your real hours.
  - #link("https://www.cs.cmu.edu/~mblum/research/pdf/grad.html")[Advice to a Beginning Graduate Student] (Manuel Blum) --- Short, warm wisdom on handling self-doubt and learning how to think like a researcher.
]

// ============================================================================
// PART II
// ============================================================================
#part-page(
  "II",
  "Doing Research",
  "Breaking existing code before reading fifty papers, picking real problems, open-sourcing without worrying about scoops, and using AI while still owning your work.",
)

// ----------------------------------------------------------------------------
// CHAPTER 4
// ----------------------------------------------------------------------------
= Break Something First, Read 50 Papers Later <ch:break-first>

#chapter-opener([Reading fifty polished papers before writing a line of code is a great way to demotivate yourself. Dig into existing code or proofs first.])

#simpsons[Facts are meaningless. You can use facts to prove anything that's even remotely true.]

When new PhD students start a project, they usually want to spend their first semester taking two extra background courses and reading 40 papers so they feel "ready."
In practice, that usually backfires.

== The Reading Trap

When you spend months reading papers before touching code or proofs:

+ *Polished papers hide all the flaws.* Authors clean up the dead ends, hide fragile settings, and make the final method look effortless. Reading twenty of those in a row rarely gives you new ideas---instead it triggers imposter syndrome (*"There is so much good work already, how can I possibly come up with something better?"*).
+ *Nothing sticks.* Until you have fought with the problem yourself, every paper blends together and you forget Paper #1 by the time you reach Paper #10.
+ *Reading feels like progress when it isn't.* Highlighting PDFs and organizing Zotero folders feels productive, while months pass with zero experiments or prototypes.

#polite-vs-real(
  [Begin a new research project with a comprehensive literature review to build foundational mastery and identify gaps in prior work.],
  [Read *one or two* core papers, clone the best existing tool, run it, make changes, and break something (or reimplement it from scratch). Once you understand the code deeply and get frustrated by its actual limitations, *then* read the literature---you will spot the flaws hidden behind polished writing immediately.],
) #sorry

== The Chess Club Rule: Play First, Study Openings Later <sec:chess-club>

I actually don't encourage my students to take extra courses or read lots of papers before starting their project.
I want them to dig right into existing code, modify it, break it, and if helpful, *reimplement it from scratch*.

People love saying "don't reinvent the wheel," but in research, reinventing the wheel is one of the best ways to understand something deeply---and understanding something deeply is how you come up with ideas that beat the state of the art.
Every published tool has limitations; you just can't see them from reading the PDF.

The same thing applies to theoretical work: don't just nod along through a published proof. Look for gaps or awkward assumptions in the proofs and theorems, try to simplify them, and while you're at it, formalize the proof in a proof assistant like Lean 4. Nothing exposes hand-waving in a proof faster than trying to make Lean accept it.

#from-roars(title: "From the ROARS Lab: How We Teach Kids Chess")[
  I apply the exact same approach to the kids in the elementary school Chess club my wife and I run (and our club consistently ranks as the top team in the county).
  Beginners do *not* study openings and endgame theory when they start---they just play lots of games and go to tournaments (cry a lot, and then win a lot).
  The kids who stick with it and want to get better study openings and endgames *later*, once they actually care.

  Research is the same. Once you understand a tool or proof deeply by wrestling with it yourself, you will be motivated to read papers---and you will read them without the "wow" or imposter-syndrome feeling, able to appreciate the good parts and spot the weak parts hidden in the polished writing.
] #sorry

== Reading Papers Critically (Not Like a Textbook)

Once you are actively working on a problem, you *do* need to read a lot of papers---just stop reading every paper linearly from Page 1 to Page 12.

Combine Srinivasan Keshav's #link("https://web.stanford.edu/class/cs245/readings/how-to-read-a-paper.pdf")[_Three-Pass Method_] with Jason Eisner's #link("https://www.cs.jhu.edu/~jason/advice/how-to-read-a-paper.html")[_How to Read a Technical Paper_]:

+ *Pass 1 (5--10 minutes):* Read the title, abstract, intro, section headings, figures, and conclusion. Ask: *What problem are they solving, what is the main claim, and does this matter for my work?* Stop here for most papers---closing an irrelevant paper after 5 minutes is a good habit, not laziness.
+ *Pass 2 (30--60 minutes):* Read the rest carefully, skipping dense proofs. Pay close attention to the evaluation: what benchmarks did they pick, what baselines are missing, and where do their own numbers look weak?
+ *Pass 3 (2--4 hours):* Reserve this for the 5--10 papers closest to your own work. Reconstruct the core idea mentally (or in code) and ask what breaks if you change an assumption or scale up the input.

#tip-block[
  Keep a simple running notes file (plain Markdown, Org-mode, or Zotero notes---don't waste two weeks building an elaborate note-taking system). For every Pass-2/3 paper, write four short lines in your own words: (1) core idea, (2) why it works, (3) main limitation, and (4) how it relates to your project. When you write Related Work six months later, you will be glad you did.
]

#other-labs[
  In heavily mathematical areas (e.g., cryptography, complexity theory, or formal semantics), you sometimes do need a baseline of notation and standard theorems first. Even there, alternate between reading and actively trying small counterexamples or exercises by hand instead of spending months only reading.
] #sorry

#further-reading[
  - #link("https://web.stanford.edu/class/cs245/readings/how-to-read-a-paper.pdf")[How to Read a Paper] (Srinivasan Keshav) --- The 3-pass method; takes 10 minutes to read and saves hundreds of hours.
  - #link("https://www.cs.jhu.edu/~jason/advice/how-to-read-a-paper.html")[How to Read a Technical Paper] (Jason Eisner) --- How to read critically rather than passively.
  - #link("https://visionbook.mit.edu/how_to_do_research.html")[How to Do Research] (*Foundations of Computer Vision* authors) --- Fresh, practical guide to moving from reading to concrete experiments.
]

// ----------------------------------------------------------------------------
// CHAPTER 5
// ----------------------------------------------------------------------------
= Finding Problems, Developing Taste, and Owning a Project <ch:finding-problems>

#chapter-opener([Anybody can grind out an incremental "+1.2% on Benchmark X" paper. The real skill of a PhD is developing taste: knowing which problems are worth two years of your life and which ones are dead ends.])

#simpsons[If something's hard to do, then it's not worth doing.]

In Year 1, your advisor usually hands you a starter project---or pairs you with a senior student on an existing codebase. Take it gladly. It gets you moving, teaches you the tools and venues, and helps you ship an early co-authored paper.

By Year 3, though, your goal is to *own your own line of work*. That means learning the hardest, least-taught skill in all of computer science: *choosing good problems.*

== What Makes a Problem Worth Working On?

Richard Hamming gave a famous talk at Bell Labs called #link("https://www.cs.virginia.edu/~robins/YouAndYourResearch.html")[_You and Your Research_] where he asked scientists at lunch: *"What are the most important problems in your field? And if you aren't working on one of them, why not?"* (People hated sitting with him at lunch, which tells you he hit a nerve.)

You don't need to solve P vs. NP in Year 2. But before sinking six months into an idea, run it through four blunt filters:

+ *If this works completely, will anyone care?* Imagine your paper is already written and every experiment succeeded beyond your wildest dreams. Is the headline *"We solved a real bottleneck everyone hits"* or *"We combined Technique A with Minor Twist B and improved metric C by 0.8% on a toy dataset"*? If even the *best-case* outcome sounds boring, kill the project now.
+ *Do you have a real advantage here?* Trying to compete head-on in training giant frontier models from scratch when you have four university GPUs and big industry labs have tens of thousands isn't brave---it's just bad odds. Pick problems where better algorithms, formalism, or a clever angle beat raw compute.
+ *Can you measure whether it actually worked?* Vague goals ("improve software quality," "make AI safer") lead to vague papers. Good problems have a clear failure case, concrete benchmarks or theorems, and an obvious before-and-after.
+ *Do you actually care about it?* You will be stuck with this problem for 6--18 months, including weeks when nothing works. If you picked it only because it's trendy right now, you will lose steam fast.

#from-roars(title: "From the ROARS Lab: Don't Just Publish---Build Tools That Beat People")[
  In my advising guide, I start with the boring neutral academic answer---"our work is on developing new techniques/algorithms and building tools for top-tier conferences"---and then cross it out.

  The fact is that we don't just publish papers or produce boring incremental results. We focus on developing tools that actually work, win competitions, and receive awards. Our competitors are the best in the world and we enjoy *beating them* (for example, #link("https://code.roars.dev/neuralsat")[NeuralSAT] consistently competes at the top of the neural network verification competition).

  Notice also that when you go after hard fundamental problems, they often end up solving real industry problems anyway. We didn't set out to solve "industry problems," yet KimHao's work on build systems applied directly to large-scale software development at Facebook, and Hai's work on DNN verification applies directly to safety-critical ML systems.
] #sorry

== Developing Taste (And Avoiding Incremental Traps)

"Research taste" isn't mysterious; it mostly comes from paying attention to three things:

- *Study test-of-time papers, not just yesterday's arXiv.* Look at 10-year award winners at ICSE, PLDI, OOPSLA, CAV, SOSP, NeurIPS, or CVPR and ask why they still matter while most papers from the same year were forgotten. Usually they framed a clean problem or found a simple insight that unlocked a whole line of follow-up work.
- *Avoid "hammer looking for a nail."* Don't learn one fancy technique and try to force it onto five random domains. Start from a real bottleneck first, then pick whatever method actually solves it.
- *Read David Patterson's anti-patterns.* His talk #link("https://people.eecs.berkeley.edu/~pattrsn/talks/BadCareer.pdf")[_How to Have a Bad Career in Research/Academia_] is funny and painfully accurate on how smart people waste years on tiny problems or jump on trends two years too late. #sorry

== When to Push Through vs. When to Pivot

Every research project hits stretches where nothing works for weeks. The hard part is telling whether you are one idea away from a breakthrough or just stuck in a dead end.

A few practical guardrails:
- *Set a short check-in deadline.* Before going down a risky path, decide upfront: *"If I can't get a minimal prototype working on a simple synthetic case in three weeks, I'll pause and re-evaluate."*
- *Separate bugs from broken assumptions.* Engineering bugs are fixable; a broken core premise (e.g., your assumption doesn't hold on real inputs, or a trivial baseline already gets 98%) means it's time to rethink.
- *Don't let sunk-cost pride trap you.* Throwing away two months of code is annoying; throwing away fourteen months because you refused to admit Month 2 didn't work is much worse. I worked on program repair for years and eventually crossed it out and moved on to neural network verification and Lean 4 formalization. Good researchers move on when a topic stops paying off.

#tip-block[
  *Test on a tiny toy example first.* As John Schulman points out in #link("http://joschu.net/blog/opinionated-guide-ml-research.html")[_An Opinionated Guide to ML Research_], run your idea on the smallest example where you know the ground truth and can iterate in seconds. If it fails on a 10-line toy problem, scaling it to 10,000 benchmarks won't save it.
] #sorry

#further-reading[
  - #link("https://www.cs.virginia.edu/~robins/YouAndYourResearch.html")[You and Your Research] (Richard Hamming) --- Mandatory reading once a year during your PhD.
  - #link("http://joschu.net/blog/opinionated-guide-ml-research.html")[An Opinionated Guide to ML Research] (John Schulman) --- Brilliant advice on problem selection, incremental debugging, and knowing when to pivot (useful well beyond ML).
  - #link("https://people.eecs.berkeley.edu/~pattrsn/talks/BadCareer.pdf")[How to Have a Bad Career in Research/Academia] (David Patterson) --- Funny, sharp inversion of all the ways smart people waste their careers.
  - #link("https://researchhowto.wordpress.com/")[How to Do Great Research] (Nick Feamster & Alex Gray) --- Practical guidance on shaping raw ideas into publishable contributions.
]

// ----------------------------------------------------------------------------
// CHAPTER 6
// ----------------------------------------------------------------------------
= Research Engineering, Open Source, and Not Fearing Scoops <ch:engineering>

#chapter-opener([Ideas are cheap; execution is everything. Write reproducible research code, open-source it without paranoia, and don't let "fear of getting scooped" turn you into a hermit.])

#simpsons[Wait a minute. Bart's teacher is named Krabappel? I've been calling her Crandall! Why didn't someone tell me?]

Half of a CS PhD is not gleaming algorithms on a whiteboard---it is wrestling with Python dependencies, cluster job queues, broken benchmarks, 3 AM experiment crashes, and trying to remember which command produced `table2_final_FINAL_v3.csv` four months ago when a reviewer asks for one extra column.

== Good-Enough Research Engineering

You are not writing banking software, so don't spend three months over-engineering an elaborate framework for a prototype you might discard next week.
On the other hand, sloppy, unrepeatable scripts *will* come back to bite you right before a rebuttal or camera-ready deadline.

Aim for what Greg Wilson and collaborators call #link("https://doi.org/10.1371/journal.pcbi.1005510")[_Good Enough Practices in Scientific Computing_]:

- *Put everything in Git from Day 1.* Code, benchmark scripts, plotting scripts, and paper drafts. Commit often so you never lose a working version two days before a deadline.
- *Generate tables and figures from scripts.* Don't hand-copy numbers from terminal output into LaTeX tables. Write a script that reads raw logs and outputs the CSV, plots, or LaTeX macros automatically.
- *Log the environment and git commit with each run.* Save random seeds, library versions, hardware specs, and command-line flags. When a reviewer asks why Baseline X ran slower in your Table 2, you want exact logs, not guesswork.
- *Fix your basic shell tooling early.* If `tmux`, `ssh`, `rsync`, `grep`, Docker/Conda/uv, and basic Bash still slow you down, spend a weekend on MIT's #link("https://missing.csail.mit.edu/")[_The Missing Semester of Your CS Education_]. It saves hours every single week.
- *Set up your researcher accounts once.* Register an #gls("ORCID") (#link("https://info.orcid.org/researchers/")[orcid.org]), set up #link("https://www.zotero.org/support/")[Zotero] (or whatever bibliography tool you like), put up a simple personal webpage with your papers and repos, and claim Google Scholar once your first paper is out.

#figure(
  image("files/pizzabox.jpg", width: 52%),
  caption: [Real CS research engineering: a high-end RTX GPU inside a Threadripper lab server held up by an Arduino cardboard box and a pad of sticky notes. Make it reproducible, not pretty.],
) <fig:pizzabox> #sorry

== Stop Safeguarding Your "Secret Sauce" <sec:scooping>

Many PhD students are overly worried about getting *scooped*---they stay quiet about their projects at workshops, avoid #gls("arxiv"), and keep their code locked in private repos for years.

In short, that mindset hurts you far more than it helps.

#polite-vs-real(
  [Researchers should carefully manage disclosure of preliminary ideas and code prior to peer-reviewed publication to protect intellectual priority.],
  [We have plenty of ideas, so if someone steals one, we should be *amused, flattered, and consider it a compliment*! Ideas are meant to be executed. If we fail to execute our own idea fast enough, we are the ones to blame---not the people who actually built it.],
)

#from-roars(title: "From the ROARS Lab: Everything Open-Source, Even Before Publication")[
  In my lab, *all* of our projects---even ongoing ones and ones with industry collaborators---are open-source and publicly available at #link("https://code.roars.dev")[code.roars.dev].

  If people---even direct competitors in the same area---are curious about our work or want our code or benchmarks, we give it to them and help them run it. No hiding the "secret sauce."
  If we can't get an idea to work ourselves, we might as well give it to others (and they can acknowledge us or not---doesn't matter to me).
  More practically, open-sourcing everything is free advertisement: when other groups run your tool as a baseline and build on top of it, your work gets used and cited far more than a paper whose code is "available upon request."
]

#other-labs[
  Always check constraints *before* making a repo public. If your project involves proprietary company data from an internship, sensitive human-subjects/medical data under IRB, security zero-day vulnerabilities under responsible disclosure, or a restricted contract, follow those rules strictly. And if your advisor keeps code private until submission or acceptance (e.g., under strict double-blind rules), respect that---just release it publicly as soon as the paper is out.
] #sorry

== Artifact Evaluation (AE): Both Sides Honestly <sec:ae>

Many top CS conferences---especially in SE, PL, Systems, and Security---run #gls("AE") tracks backed by #link("https://www.acm.org/publications/policies/artifact-review-and-badging-current")[ACM artifact review and badging] (*Artifacts Available*, *Artifacts Evaluated -- Functional/Reusable*, *Results Reproduced*).

The goal is good, though in practice AE is a mixed bag:

- *The good part:* Cleaning up your code and Docker/environment scripts so a stranger can run it catches real bugs in your own experiments and makes your GitHub repo much more usable later.
- *The frustrating part:* Honestly, I am not a big fan of AE and avoid it unless a conference requires it. AE reviewers often don't have the hardware (e.g., big GPU servers) or fast internet needed to run heavy experiments or download huge VM images; they try to install your code locally, hit a small snag, don't communicate with you to fix it, and just give a bad review.

If your conference requires AE (or you decide to submit):
+ Include a fast *"kick-the-tires" script* that reproduces the main trends on a laptop in 15--30 minutes alongside your full-scale scripts.
+ Containerize cleanly (Docker/Podman or a pinned environment) and test it on a *fresh machine* without your local dotfiles.
+ Remember that *maintaining an open GitHub repo and actually answering user Issues* helps the community much more than grabbing an AE badge and abandoning the repo afterward.

#figure(
  image("files/xkcd_standards.png", width: 65%),
  caption: [Why every CS subfield has twelve incompatible benchmark formats and "unified" evaluation harnesses. Source: #link("https://xkcd.com/927/")[xkcd \#927] (CC BY-NC 2.5).],
) <fig:standards> #sorry

#further-reading[
  - #link("https://doi.org/10.1371/journal.pcbi.1005510")[Good Enough Practices in Scientific Computing] (Greg Wilson et al.) --- Realistic, non-dogmatic habits for organizing code, data, and projects.
  - #link("https://missing.csail.mit.edu/")[The Missing Semester of Your CS Education] (MIT) --- Shells, git, vim/editors, debugging, profiling; fix your tooling gaps once and for all.
  - #link("https://stanforddatascience.github.io/best-practices/")[Open, rigorous and reproducible research] (Stanford Data Science) --- Modern handbook on computational reproducibility.
  - #link("https://www.acm.org/publications/policies/artifact-review-and-badging-current")[ACM Artifact Review and Badging] --- Official definitions of what AE committees actually check.
]

// ----------------------------------------------------------------------------
// CHAPTER 7
// ----------------------------------------------------------------------------
= Using AI and LLMs in CS Research (Without Losing Your Brain) <ch:ai-research>

#chapter-opener([Ignoring AI tools in CS research today makes no sense, and blindly trusting their output is even worse. Use them heavily, understand what they produce, and verify everything.])

#simpsons[I, for one, welcome our new insect overlords.]

Almost none of the classic PhD guides in #link("https://github.com/dynaroars/phd-cs-us/blob/main/current-students.md")[our resource list] talk about LLMs and coding agents, simply because they were written before 2023.
Yet this is now a daily question for every CS PhD student: how much should you use AI for coding, proofs, and writing, and where does it cross the line?

== Use AI Extensively---Just Own the Work

I use AI tools *extensively* in my own research, and I don't just allow my students to use them---I expect them to know how to use AI to work faster.
A big chunk of CS research is tedious scaffolding (parsing logs, plotting scripts, benchmark harnesses, debugging, web demos), and AI lets you spend your energy on the actual research ideas instead of boilerplate.
For example, I "vibe-coded" multiple projects, including #link("https://cspicks.roars.dev")[CSPicks] and #link("https://vietprofs.roars.dev")[VietProfs], that would not exist without AI tools.

The catch is simple: *you are responsible for understanding and standing behind everything with your name on it*---don't just run a couple of prompts and call it done.

#polite-vs-real(
  [Researchers should exercise appropriate human oversight when utilizing generative AI tools in accordance with venue guidelines.],
  [I do *not* care if you read every line of AI-generated boilerplate. I *do* care if you can't explain the algorithm behind it, shipped hallucinated citations, or handed me glossy AI-generated prose that you didn't bother rewriting.],
) #sorry

== Coding & Proofs With AI: Iterate and Verify

When using AI for research code or proofs, keep three habits:

+ *Iterate until you understand the design.* For CSPicks and VietProfs, I didn't read every line of generated code, *but* it took hundreds of iterations with AI to get the design, edge cases, and behavior right (and I still keep improving them). If a committee member asks why your algorithm handles Case 3 a certain way and your answer is "Claude wrote it," you don't actually understand your own research.
+ *Assume AI output has bugs until proven otherwise.* LLMs sound completely confident while slipping in off-by-one bugs, data leakage in ML splits, unfair baselines, or broken proof steps. Write strict unit tests, differential tests against simple oracles, and small toy sanity checks.
+ *Verify formally whenever possible.* Because AI makes subtle mistakes and humans can't manually audit everything, formal verification matters more than ever. In our lab, we increasingly formalize implementations, specifications, and proofs in *Lean 4* so a proof assistant checks correctness (nothing is 100% guaranteed since Lean itself is software and could have bugs, but it is far more reliable than human eyeballs---or an LLM). #sorry

== Writing With AI: The `sorry` Workflow <sec:sorry-workflow>

If you paste a raw ChatGPT or Claude paragraph into a paper, experienced reviewers spot it right away.
The generic flowery tone---*"In the rapidly evolving landscape of..."*, *"delve into"*, *"crucial pivotal paradigm"*---not only reads badly, it makes reviewers suspicious that the technical work is sloppy too.

AI is still very useful for getting past a blank page, fixing grammar (especially for non-native English speakers), and tightening structure. You just have to rewrite the output so it is actually *yours*.

#from-roars(title: "From the ROARS Lab: Putting `sorry` After Every AI Paragraph")[
  In my own writing, whenever I draft a paragraph with AI, I immediately put *`sorry`* right after it (a Lean keyword marking something that is not yet proven).

  That `sorry` reminds me that the paragraph isn't done yet: I have to reread it carefully, check every claim, strip out the generic AI phrasing, and usually rewrite pretty much the whole thing in my own words. Only after doing that do I delete the `sorry`. (In fact, you can see those exact `sorry` markers throughout this draft!)
] #sorry

== Take Deliberate "AI Retreats"

One real risk with heavy AI usage is quietly losing your own technical muscle.
If an AI writes every function, derives every step, and summarizes every paper from Day 1, you stop building first-principles intuition.

Even though I use AI extensively, I deliberately take *"AI retreats"* to do old-school research:
- Reading printed papers with a pen---no chat sidebar or auto-summary.
- Writing in pure Emacs without AI assistance finishing my sentences.
- Learning a new language like Lean 4 by manually typing code, compiling it, and wrestling with the errors myself.

Carve out AI-free blocks during your week, especially when learning something new or working through the core idea of a paper. #sorry

== Conference Rules and Academic Integrity

Conference policies on AI are changing every year, so check the CFP of every venue you submit to. Four things will get your paper desk-rejected or put your career at risk:

+ *Hallucinated citations.* Fake references invented by an LLM are an immediate red flag and a common reason for desk rejection. Verify every single BibTeX entry against DBLP, Google Scholar, or the actual PDF.
+ *Pasting papers you are reviewing into public LLMs.* Almost every major CS conference forbids uploading confidential submissions under review into external AI tools. Never use an LLM to write your peer reviews.
+ *Skipping required disclosures.* If a venue asks you to disclose AI use (e.g., copy-editing vs. code generation), answer honestly.
+ *Plagiarism by proxy.* If an AI reproduces someone else's text or code verbatim, *you* are still responsible for plagiarism.

#caution-block[
  Keep the basic rule from #link("https://www.acm.org/publications/policies")[ACM's publication policies] in mind: an AI cannot be an author and cannot take responsibility for mistakes. Saying *"the model generated it"* is not a defense if your paper has a fake number, broken proof, or hallucinated citation.
] #sorry

#further-reading[
  - #link("https://www.acm.org/publications/policies")[ACM Publications Policies] --- Check the current policy on authorship and generative AI before every ACM submission.
  - #link("https://ori.hhs.gov/education/products/RCRintro/")[Introduction to the Responsible Conduct of Research] (ORI) --- Core principles on integrity, falsification, and responsibility that apply regardless of tools.
  - #link("https://roars.dev/phd-cs-us/advising.pdf")[ROARS Lab Advising Guide] --- See the final section on AI usage, vibe-coding, and formal verification in practice.
]

// ============================================================================
// PART III
// ============================================================================
#part-page(
  "III",
  "Writing, Publishing, and Peer Review",
  "Structuring CS papers for busy reviewers, sharing credit cleanly, treating rebuttals as bug reports, and learning how to review fairly.",
)

// ----------------------------------------------------------------------------
// CHAPTER 8
// ----------------------------------------------------------------------------
= Writing CS Papers That Actually Get Accepted <ch:writing>

#chapter-opener([Good research buried in bad writing gets rejected all the time. Writing isn't an afterthought---it's how you find out if your ideas actually hold up.])

#simpsons[English? Who needs that? I'm never going to England.]

Many PhD students treat paper writing as packaging: finish all the experiments first, and then type up the paper during the last five days before the deadline.
That is an easy way to get solid research rejected because reviewers can't tell what the problem is or why the results matter.

== Write the Paper First

Jason Eisner's essay #link("https://www.cs.jhu.edu/~jason/advice/write-the-paper-first.html")[_Write the Paper First_] gives practical advice that sounds backwards until you try it: *start drafting the paper while the research is still in progress.*

Draft the title, abstract, introduction, motivating example, and skeleton tables/figures (with `TBD` placeholders) weeks ahead of the deadline. Two useful things happen immediately:
+ *Unclear ideas show up right away.* If you can't explain in two clear paragraphs why your method beats existing work, the idea isn't crisp yet.
+ *You stop running irrelevant experiments.* Outlining the Evaluation section tells you the exact research questions and baselines you actually need, instead of wasting weeks on benchmarks nobody cares about. #sorry

== Anatomy of a Strong CS Paper <sec:paper-anatomy>

Busy conference reviewers don't read a 12-page paper waiting for a surprise ending on Page 10. Most reviewers form their main impression by Page 2, so put serious effort into the first two pages:

- *Title and Abstract:* State the problem, your main idea, and the headline result plainly. Many reviewers bid on papers using *only* the title and abstract, so vague titles get you assigned to the wrong reviewers.
- *Introduction:* Keep it direct and cover four things clearly:
  + What problem are you solving and why does it matter?
  + Why do existing approaches fall short? (Be specific, not *"prior work has limitations."*)
  + What is your main idea, and why does it overcome that obstacle?
  + What concrete results back it up? (Summarize your tool/theorems and headline numbers in a clean list of contributions.)
- *Motivating Example:* Right after the Introduction, walk through one small, concrete example showing existing work failing and your method working. A clear motivating example often does more heavy lifting than five pages of formal definitions.
- *Core Technique / Formalism:* Give the intuition first, then the math or algorithm. Don't drop a wall of Greek letters and inference rules on Page 4 before explaining in plain English what each part does. (Dimitri Bertsekas makes this point well in #link("https://www.mit.edu/~dimitrib/Ten_Rules.html")[_Ten Simple Rules for Mathematical Writing_].)
- *Evaluation:* State your research questions clearly, compare against real baselines, report timeouts and failures honestly, and include ablations showing which part of your method actually helps. Never cherry-pick benchmarks---reviewers know the standard baselines in your area.
- *Related Work:* Don't just list *"Smith [1] did X. Jones [2] did Y."* Group related approaches and explain clearly how your work differs---and don't trash-talk other papers (there is a good chance one of those authors is reviewing yours).

#polite-vs-real(
  [Authors should rigorously situate their technical contributions within the broader scholarly literature using precise domain terminology.],
  [Assume your reviewer is a smart CS researcher who is *not* an expert in your tiny sub-niche, is reading your paper late on a Sunday night, and has 9 other papers to review. If they have to re-read Section 2 three times just to figure out your input and output, you're in trouble.],
) #sorry

== Five Common Mistakes That Sink Papers

After reading hundreds of student drafts, conference submissions, and NSF proposals, I see the same five problems over and over:

+ *Assuming reviewers already know your niche.* Someone in SE or FM may know the broad field without knowing the details of "gradual refinement types" or "branch-and-bound neural verification." Have someone outside your exact project read your Introduction---if they get lost, rewrite it.
+ *Walls of text and walls of formulae.* Break up long paragraphs. Use clean diagrams and readable tables, and make every figure caption self-contained.
+ *Overclaiming.* Claiming your prototype "solves software verification" or "guarantees AI safety" practically begs a reviewer to find one counterexample and reject it. Reviewers trust honest, scoped claims much more than hype.
+ *Burying your best result on Page 9.* Put your strongest result in the Abstract and Introduction.
+ *Sloppy plots.* Tiny axis fonts, colors that disappear in grayscale, missing units, or 3D bar charts for 2D data make good experiments look amateurish. #sorry

== Advisor Editing and Building a Writing Habit

Don't get discouraged when your advisor heavily marks up your first paper draft.

#from-roars(title: "From the ROARS Lab: Heavy Rewrites Early, Hands-Off Later")[
  For a student's first papers, I ask for drafts (usually on Overleaf) and revise them iteratively with the student---sometimes rewriting large parts of the Intro, Motivating Example, and Evaluation myself. That helps new students see how papers are structured and what I expect.

  As you get more experience, I let go more and more. Once you can write and publish top papers on your own without much editing from me, that is how I know you are ready to graduate (@sec:graduation-test).
]

One practical habit for actually getting drafts written: don't wait for "inspiration" or a mythic free Saturday. As Paul Silvia argues in #link("https://www.apa.org/pubs/books/4441031")[_How to Write a Lot_] (and Joli Jensen in #link("https://press.uchicago.edu/ucp/books/book/chicago/W/bo26049293.html")[_Write No Matter What_]), steady 60--90 minute daily writing blocks beat last-minute panic every time.

And yes, learn *LaTeX* early since almost every CS venue requires its official LaTeX template. *Typst* (which this book uses) is much nicer for your own notes, advising guides, and books, and a few workshops accept it---just be comfortable in LaTeX too so you aren't fighting formatting 24 hours before a deadline. #sorry

#further-reading[
  - #link("https://www.cs.jhu.edu/~jason/advice/write-the-paper-first.html")[Write the Paper First] (Jason Eisner) --- Changes how you plan research projects forever.
  - #link("https://billf.mit.edu/wp-content/uploads/2014/02/cvprPapers.pdf")[How to write a good CVPR submission] (Bill Freeman) --- Short, razor-sharp advice that applies to almost every CS conference.
  - #link("https://people.csail.mit.edu/fredo/PUBLI/writing.pdf")[Notes on writing] (Frédo Durand) --- Clear, blunt principles on structure and clarity.
  - #link("https://mitcommlab.mit.edu/eecs/use-the-commkit/")[MIT EECS Communication Lab CommKit] --- Annotated real examples of abstracts, papers, figures, and introductions.
  - #link("https://www.mit.edu/~dimitrib/Ten_Rules.html")[Ten Simple Rules for Mathematical Writing] (Dimitri Bertsekas) --- Essential if your papers contain proofs or heavy notation.
]

// ----------------------------------------------------------------------------
// CHAPTER 9
// ----------------------------------------------------------------------------
= Authorship, Credit, and Research Ethics <ch:authorship>

#chapter-opener([Few things poison a research lab faster than fighting over author order. Be generous with credit, agree on roles early, and never cross the ethical lines that can end your career overnight.])

#simpsons[If you want something done right, you have to do it yourself... or get someone else to do it and put your name first.]

Academic currency is credit. Because credit determines fellowships, internships, and faculty jobs, authorship disputes get ugly fast---usually because nobody talked about it until the night before submission.

== How Author Order Works in CS

First, know your subfield's convention:
- In *most CS subfields* (SE, PL, Systems, AI/ML, CV, NLP, Security, HCI), author order is *contribution-based*:
  - *First author* is the student who led the project, built the core tool/experiments/proofs, and drove the writing. First authorship matters *enormously* when you graduate.
  - *Middle authors* contributed meaningful pieces (a module, dataset, proof, evaluation, or writing).
  - *Last author* is typically the senior advisor/PI who advised and funded the work.
  - *"Equal contribution" (`*`)* is common in ML/CV when two students genuinely split the load 50/50---just don't abuse it by putting stars on four authors when one person clearly carried the project.
- In *Theoretical Computer Science* (STOC, FOCS, SODA, CRYPTO), authors are listed *strictly alphabetically* by last name. (Yes, people whose last name starts with A or B quietly love this system.)

#figure(
  image("files/phd030810s.png", width: 85%),
  caption: [Why clear, honest authorship norms matter. Source: #link("https://phdcomics.com")[PhD Comics] (© Jorge Cham).],
) <fig:awards> #sorry

== The "Critical 10%" Rule for Co-Authorship <sec:critical-ten>

Students often ask: *"If someone contributed only a little to my paper, do they really deserve co-authorship?"*

#from-roars(title: "From the ROARS Lab: Why the Last 10% Deserves Co-Authorship")[
  "Little" is subjective! We don't go looking for co-authors to pad a paper, but if someone helps make the work better, we share credit.
  Even if you did 90% of the work, got stuck on the remaining 10%, and someone else solved that 10% so the paper could ship, *offer them co-authorship* (you are still the first author).

  The point is simple: if we can't ship the work without that 10%, then that 10% was hard and necessary---not "little."

  Also, once someone is a co-author, they can claim the work as theirs, talk about it, or build on it later without involving us every time. Don't waste energy worrying about that. If they talk a lot about the paper, that's free advertisement for us---and if they completely "steal" it, consider it a compliment (@sec:scooping).
]

#paragraph[Where the Line Actually Is (No Gift Authorship)][
  Sharing credit generously does *not* mean adding people who did zero real work:
  - Someone who only proofread typos, lent you a GPU account, or gave a 5-minute hallway tip belongs in Acknowledgments, not the author list.
  - *Gift authorship* (adding a friend who didn't touch the project, or a famous professor hoping their name helps get the paper accepted) violates #link("https://www.acm.org/publications/policies")[ACM/IEEE policies].
]

#tip-block[
  *Agree on author order early---not at 11 PM on submission night.* When starting a multi-student project, settle roles in Week 2 (with your advisor in the loop). If the actual work split changes dramatically later, talk about it openly right away.
] #sorry

== Research Integrity: Lines You Never Cross

In #link(demystifyurl)[_Demystifying PhD Admissions_], I already covered cheating on class exams and homework. In research, the consequences are even heavier: a single proven misconduct case can get a paper retracted, get you banned from ACM/IEEE venues, or cost you your PhD.

No deadline is worth going near these five lines:

+ *Fabricating or massaging results:* Making up numbers, hiding runs that crashed, or tuning on your test set while claiming it's held-out. If your method loses on 2 out of 10 benchmarks, report those 2 losses honestly and explain why.
+ *Plagiarism and self-plagiarism:* Copying prose, figures, or code without attribution---including pasting verbatim chunks from your own earlier paper without rewriting and citing it properly.
+ *Dual submission:* Submitting the same (or heavily overlapping) paper to two peer-reviewed venues at the same time. (Posting a preprint on #gls("arxiv") is usually allowed, though check each conference's anonymity policy.)
+ *Breaking double-blind anonymity:* Linking to your personal GitHub username, leaving your university name in PDF metadata or acknowledgments, or promoting a blinded submission in ways the venue forbids.
+ *Hiding conflicts of interest:* Failing to declare recent collaborators, advisors, or labmates as #gls("COI") in the submission system.

If an experiment breaks 36 hours before a deadline, either fix it honestly, report the limitation, or wait for the next deadline. Missing a deadline costs a few months; a retracted paper follows your name forever. #sorry

#further-reading[
  - #link("https://ori.hhs.gov/education/products/RCRintro/")[Introduction to the Responsible Conduct of Research] (U.S. Office of Research Integrity) --- Clear, authoritative baseline on data management, authorship, and misconduct.
  - #link("https://www.acm.org/publications/policies")[ACM Publications Policies] --- Exact definitions of authorship criteria, plagiarism, prior publication, and double-blind rules.
]

// ----------------------------------------------------------------------------
// CHAPTER 10
// ----------------------------------------------------------------------------
= Submitting, Rebuttals, and Handling Rejection <ch:rebuttals>

#chapter-opener([Peer review at top CS conferences is noisy. Don't send out half-baked feelers, treat rebuttals as bug reports, and don't take rejection personally.])

#simpsons[You tried your best and you failed miserably. The lesson is: never try.]

Every PhD student remembers their first harsh set of reviews. You spend months on a project, submit a paper you're proud of, and two months later a reviewer clearly skimmed Section 3 and missed your main point.
It is frustrating, and it happens to everyone---including senior faculty.

== Picking Venues (And Why We Don't Send "Feelers")

In Computer Science, *peer-reviewed conferences are the main publication venues* (e.g., ICSE, FSE, ASE, ISSTA, PLDI, OOPSLA, CAV, SOSP, OSDI, CCS, NeurIPS, ICML, ICLR, CVPR, ACL, SIGMOD, STOC/FOCS). You can check major venues and deadlines at #link("https://roars.dev/csconfs")[roars.dev/csconfs].

That doesn't mean you only ever submit full papers to one narrow set of conferences:
- Aim mainly for *full papers at #gls("toptier")*, since those carry the most weight.
- Use *journals* (e.g., IEEE TSE, ACM TOSEM, TOPLAS, JMLR) when extending a conference paper or publishing long archival work.
- Use *workshops* and short-paper tracks (e.g., ICSE's #gls("NIER") track) to introduce genuinely early ideas.
- *Submit outside your usual community when another venue fits better.* Even though our home venues are SE/PL/FM, when our neural network verification work targeted computer vision and ML models, we submitted to NeurIPS, CVPR, and ICML---and got Highlight and Spotlight papers there.

One thing I am completely against, though:

#polite-vs-real(
  [Early submissions to major conferences can serve as a helpful mechanism to gauge community interest and obtain external feedback.],
  [*No.* We do not send out "feelers" just to see what reviewers think. Do not use volunteering reviewers as guinea pigs to test half-baked work---besides, comments from three reviewers do not represent "the community." Do your homework, get solid results, and submit a paper that is actually ready.],
) #sorry

== Reading Reviews Without Losing Your Cool

When reviews come back, *don't write the rebuttal while you are emotionally upset.*
Read the reviews, vent to your labmates on Discord, take a break to cool down, and come back the next day.

One thing I have learned over the years: *reviewer comments---no matter how bad or dumb they look at first---usually have some truth in them.*
If a reviewer asks a "really dumb" basic question, maybe they skimmed---or maybe we assumed too much and didn't explain things clearly enough.
If they don't like the problem, maybe we didn't motivate it well enough, or we sent it to the wrong venue.
Think of reviews as *bug reports* that make your work and writing stronger. #sorry

== Rebuttal Strategy <sec:rebuttal-rules>

Treat a #gls("rebuttal") as an opportunity to improve the paper, not to win an argument or obsess over pleasing reviewers.

#from-roars(title: "From the ROARS Lab: Four Rules for Every Rebuttal")[
  + *Always thank the reviewers for their time and feedback---no exceptions.* Even if you think their comments are unreasonable or completely garbage, acknowledge and thank them because it's the right thing to do.
  + *Don't try to guess "the champion" and "the defector."* Common advice says to spot the reviewer who likes your paper and feed them ammunition to fight the negative reviewer. I don't follow that strategy. Even negative comments usually have useful truths in them, and you often misread reviewers anyway---a "champion" might stay quiet during discussion, while an initially negative reviewer can change their mind and push for acceptance if you address their real concern.
  + *Stick to facts, concrete results, and realistic promises.* Answer the main concerns first. If a quick extra experiment or ablation answers a real question, run it and include a compact table. Don't over-promise changes you can't actually fit.
  + *Don't be defensive.* Never write *"As we clearly stated in Section 3.2..."* Just say *"Thank you for pointing this out; we will make X much clearer in Section 3.2 as follows..."*
]

In most cases at top conferences, rebuttals don't save a paper and it still gets rejected. In some cases, though, a calm, thorough rebuttal genuinely flips the reviewers' minds (@fig:rebuttal).

#figure(
  image("files/cvpr-acceptance.png", width: 92%),
  caption: [Real metareview from our lab: even with largely negative initial reviews, a thorough rebuttal changed the reviewers' minds, got unanimous acceptance at CVPR'26, and won a *Highlight* Paper Award.],
) <fig:rebuttal> #sorry

== Knowing When to Withdraw <sec:withdrawal>

If the reviews are very negative (not even borderline) and there is a real flaw or venue mismatch, *just withdraw the paper.*
That saves both your time and the reviewers' time.
Even when you withdraw, still leave a short note *thanking the reviewers for their time and feedback* and saying you are withdrawing to address their concerns properly. #sorry

== Rejection Is Normal

Getting rejected at top CS conferences is routine---acceptance rates are often 15--25%, and reviewing is noisy (NeurIPS's own experiments showed two independent committees disagree on roughly half of borderline accepted papers).

In my own lab, our compositional verification paper was rejected at CAV'25; we fixed the issues, improved it, and resubmitted---and it won a *Research Spotlight Award at NeurIPS'25*.
Just don't blindly resubmit the exact same PDF without fixing the real concerns (there is a very real chance you'll get one of the *same* reviewers at the next venue, and ignoring their feedback is a fast way to get rejected twice). #sorry

#further-reading[
  - #link("https://roars.dev/phd-cs-us/advising.pdf")[ROARS Lab Advising Guide] --- Full version of my rebuttal philosophy and why we don't send feelers.
  - #link("https://www.sigplan.org/Resources/Policies/Review/")[ACM SIGPLAN Review Policy] --- Transparent look at how top conference committees actually run reviews and discussions.
  - #link("https://mri.beckman.illinois.edu/resources/good_paper.pdf")[How to write a (hopefully good) paper] (Martin Vetterli) --- Sharp insights on framing work so reviewers actually understand its value.
]

// ----------------------------------------------------------------------------
// CHAPTER 11
// ----------------------------------------------------------------------------
= Becoming a Good Peer Reviewer <ch:reviewing>

#chapter-opener([Reviewing other people's papers is one of the fastest ways to improve your own writing. Sitting on the other side makes every bad habit obvious.])

#simpsons[I'm not a bad guy! I work hard, and I love my kids. So why should I spend half my Sunday hearing about how I'm going to Hell?]

Around Year 2 or 3, your advisor may ask you to help as a #gls("sub-reviewer"), or a conference may invite you to join a #gls("shadow-pc") or reviewer pool. Say yes (as long as you don't overload yourself right before your own deadline).
Reading ten submissions over a weekend teaches you faster than any writing guide why a vague abstract, missing baseline, or sloppy motivating example drives reviewers crazy.

== Sub-Reviewing and Shadow PCs (Do It Ethically)

- *Sub-reviewing for your advisor:* Your advisor assigns you a paper from their PC load, you write an independent review, and you discuss it together. Note that your advisor should list you as a sub-reviewer in the submission system (when the conference allows sub-reviewing) so you get credit and COIs are tracked. Never sub-review a paper where you have a #gls("COI").
- *Shadow PCs and AE Committees:* Many SE, PL, Systems, and Security conferences (e.g., ICSE, FSE, PLDI, SOSP, EuroSys) run a #gls("shadow-pc") or AE committee for PhD students. Joining one in Year 2 or 3 lets you see how real PC discussions work.
- *Keep submissions strictly confidential:* Don't gossip about papers under review on Discord, don't share the PDF, don't borrow unpublished ideas from them, and *never* paste them into ChatGPT or Claude (@ch:ai-research). #sorry

== How to Write a Fair, Useful Review

Being a good reviewer is surprisingly simple: *actually read the paper, be specific, be fair, and don't be rude.*

Useful references here are Stanley Chan's #link("https://engineering.purdue.edu/ChanGroup/write_review.html")[_How to write a reviewer report_] and the #link("https://icml.cc/Conferences/2022/ReviewerTutorial")[ICML] / #link("https://cvpr.thecvf.com/Conferences/2026/ReviewerGuidelines")[CVPR] reviewer guidelines:

+ *Start with a short summary in your own words.* It shows the authors and #gls("AC") that you read the paper---and if you misunderstood something, the authors can see exactly where and clarify it in the rebuttal.
+ *Note real strengths first.* Even in a weak paper, point out what they got right.
+ *Be specific about weaknesses.* Separate real flaws (broken proof, data leakage, missing standard baseline) from minor typos. Don't just write *"limited novelty"* without citing the exact prior work.
+ *Say what would change your mind.* Give 2--3 clear questions for the rebuttal, and actually be open to raising your score if the authors answer them well.
+ *Review the paper they wrote, not the paper you wish they wrote.* And don't reject a paper just because it didn't cite yours.

#caution-block[
  *Watch out for "junior reviewer syndrome."* New PhD student reviewers are often the harshest reviewers on a committee because they try to look thorough by hunting down every tiny flaw. Remember that no paper is perfect---ask whether the contribution is solid and interesting enough that the community is better off having it published.
] #sorry

#further-reading[
  - #link("https://engineering.purdue.edu/ChanGroup/write_review.html")[How to write a reviewer report] (Stanley Chan) --- Concrete, structured, no-nonsense blueprint for writing fair reviews.
  - #link("https://icml.cc/Conferences/2022/ReviewerTutorial")[ICML Reviewer Tutorial] & #link("https://cvpr.thecvf.com/Conferences/2026/ReviewerGuidelines")[CVPR Reviewer Guidelines] --- Gold-standard checklists used by massive CS conferences.
  - #link("https://www.sigplan.org/Resources/Policies/Review/")[ACM SIGPLAN Review Policy] --- Clear guidance on fairness, confidentiality, and conflicts of interest.
]

// ============================================================================
// PART IV
// ============================================================================
#part-page(
  "IV",
  "Talks, Conferences, Teaching, and Mentoring",
  "Giving clear technical talks, getting real value out of conferences, balancing TA work, and mentoring undergraduates.",
)

// ----------------------------------------------------------------------------
// CHAPTER 12
// ----------------------------------------------------------------------------
= Giving Technical Talks That Don't Put People to Sleep <ch:talks>

#chapter-opener([A conference talk is not a spoken version of your 12-page paper. Its job is to make people care enough about your main idea to go read the paper.])

#simpsons[Can't someone else do it?]

Watch the audience in an afternoon session at any CS conference: within four minutes of a bad talk, half the room is checking email.
Usually the research is fine---the speaker just tried to squeeze 12 pages of definitions, 9 tables, and 45 slides into a 15-minute slot.

== What a Technical Talk Should Actually Do

Whether you are giving a 12-minute conference talk, a poster pitch, or a 45-minute seminar/defense talk, Jonathan Shewchuk's #link("https://people.eecs.berkeley.edu/~jrs/speaking.html")[_Giving an Academic Talk_] and Michael Ernst's #link("https://homes.cs.washington.edu/~mernst/advice/giving-talk.html")[_How to give a technical presentation_] boil it down to two goals:

+ *Explain the problem and core intuition, not every lemma.* Nobody can parse a 10-line formula flashed on a screen for 15 seconds. Use a simple, concrete example that shows why naive methods fail and why your idea works.
+ *Leave the audience with one clear takeaway.* People hear 30+ talks at a conference; if they remember one clear idea and one diagram from yours the next day, you did a great job.

#polite-vs-real(
  [Present your methodology, formal proofs, and full experimental evaluation systematically to demonstrate rigor.],
  [If you put a giant 12-column table on Slide 14 and say *"I know you can't read this, but..."*, you already lost the room. Cut 70% of the details, show one clean chart with readable labels, and move the rest to backup slides for Q&A.],
) #sorry

== Practical Slide and Rehearsal Rules

- *Keep slides uncluttered.* If a slide has six 3-line bullets, people either read the slide or tune you out. Use short phrases, simple diagrams, and readable plots.
- *Don't read your slides aloud.* Slides back up what you are saying; they aren't a script.
- *Carry one running example.* Just like in your paper (@sec:paper-anatomy), reuse one simple example from start to finish.
- *Watch the clock.* For a 15-minute slot, aim for 12--13 minutes of talking so there is time for questions. Running over into the next speaker's slot annoys both the session chair and the audience.
- *Practice out loud, standing up, at least three times.* Silently flipping through slides in your head doesn't count---you always talk slower out loud, and awkward transitions only show up when you actually speak them. Do a practice run in your lab meeting a week early so your labmates can catch confusing slides while you still have time to fix them. #sorry

== Handling Q&A

Q&A makes most first-time speakers nervous, though a few simple habits make it easy:

+ *Pause and repeat the question* (it gives you a few seconds to think and helps the back row hear it).
+ *Bring 5--8 backup slides* for obvious questions (extra baselines, runtime breakdown, soundness theorem, edge cases).
+ *If you don't know the answer, just say so.* Never bluff a senior researcher in the front row. Saying *"Good question---we haven't tested X yet, though my guess is Y; happy to chat after the session"* is completely fine.
+ *If someone gives a long speech instead of a question:* stay polite, say *"That's an interesting point---in the interest of time, let's chat right after the session,"* and move on. #sorry

#further-reading[
  - #link("https://homes.cs.washington.edu/~mernst/advice/giving-talk.html")[How to give a technical presentation] (Michael Ernst) --- Comprehensive, practical checklist from slide layout to Q&A.
  - #link("https://people.eecs.berkeley.edu/~jrs/speaking.html")[Giving an Academic Talk] (Jonathan Shewchuk) --- Blunt classic on how to keep an academic audience awake.
  - #link("https://mitcommlab.mit.edu/eecs/use-the-commkit/")[MIT EECS CommKit] --- Includes strong guides for posters and lightning talks alongside full presentations.
]

// ----------------------------------------------------------------------------
// CHAPTER 13
// ----------------------------------------------------------------------------
= Conferences, Summer Schools, and Networking (Even for Introverts) <ch:conferences>

#chapter-opener([Papers get you past the first filter; human relationships get you internships, collaborations, postdocs, and faculty interviews. And no, you do not have to turn into a loud extrovert to build them.])

#simpsons[I'm not normally a social person... wait, no, I'm never a social person.]

Many CS PhD students are introverts (and so are a huge fraction of CS professors---even the ones who look super charismatic on stage usually collapse in their hotel room afterward to recharge). Because of that, a lot of students fly all the way to a conference, give their 15-minute talk, sit silently in the back row for three days eating free cookies, and fly home without meeting a single person outside their own lab.

What a waste of \$2,500 in grant money.

== Why You Should Go---Even If Your Advisor Doesn't

#from-roars(title: "From the ROARS Lab: Go Even When I Stay Home")[
  Full disclosure: I am personally *not* a big fan of attending conferences. I think they are useful, I'm just not into traveling---I would rather stay home, play with my kids, and work on research.

  That is just me, though. I wholeheartedly support my students attending conferences:
  - If you have a paper at a conference---even not as first author---I support your travel to present it.
  - Even without a paper, go to *local meetings and workshops* (e.g., Northeast PL meetings at Stevens, Princeton, or UPenn) and *summer schools* (I regularly send my students to the week-long Formal Techniques Summer School in San Francisco). Small workshops and summer schools are often better for meeting people early in your PhD than 15,000-person mega-conferences.
] #sorry

== Big Conferences vs. Small Workshops

Walking into NeurIPS, CVPR, or ICSE for the first time can be overwhelming. Read Jennifer Wortman Vaughan's #link("https://medium.com/@jennwv/nine-things-i-wish-i-had-known-the-first-time-i-came-to-nips-b939330661ed")[_Nine things I wish I had known before my first NeurIPS_] and the #link("https://facct-blog.github.io/2025-06-22/newcomers")[FAccT newcomer tips] before you go:

- *Don't overschedule.* Pick 3--4 talks or poster blocks a day and leave plenty of open time for hallway chats and resting. Trying to sit through every talk from 8 AM to 6 PM just burns you out.
- *Spend real time at poster sessions.* You rarely meet anyone sitting in a dark ballroom during a talk. At a poster session, you can walk up to the author of a paper you care about, ask two real technical questions, and have an actual conversation.
- *Go to workshops and student programs.* Workshops have 50 people instead of 10,000, all working on your exact niche. Also look at the #link("https://src.acm.org/")[ACM Student Research Competition (SRC)] and mentoring workshops like #link("https://cra.org/cra-wp/grad-cohort-workshops/")[CRA-WP Grad Cohort].
- *Look for travel grants and watch visa timelines.* Many SIGs and conferences offer student travel funding (e.g., #link("https://www.sigplan.org/PAC/")[SIGPLAN PAC] for PL conferences) or student volunteer slots that cover registration. And for international conferences, check passport and visa rules months early so you don't miss your own talk. #sorry

== Networking Without Feeling Fake

Introverts usually dislike the word "networking" because it sounds forced. In academia, networking is really just talking with other people who care about the same technical problems you do:

+ *Email 2--3 people a week ahead.* Message a PhD student, postdoc, or professor whose paper you genuinely read and ask if they have 15 minutes for coffee at the conference. Half will be busy; the other half will happily say yes.
+ *Ask real questions at posters.* People love talking about their own research when someone clearly engaged with it.
+ *Meet peers, not just famous professors.* Everyone crowds around the famous keynote speaker, while the other PhD students standing next to you will be faculty members, research scientists, and hiring managers in five years.
+ *Send a short follow-up afterward.* A two-sentence email with the paper or repo link you mentioned keeps the connection alive (Phil Agre's #link("https://vlsicad.ucsd.edu/Research/Advice/network.html")[_Networking on the Network_] explains well why small, genuine follow-ups add up over time).

#tip-block[
  *In Year 3 or 4, consider co-organizing a small workshop* at your main conference with 2--3 peers from other schools. It's real work, and it introduces you to everyone in your subfield. See Ben Eysenbach and Surya Bhupatiraju's #link("https://medium.com/%40erl.leads/hitchhikers-guide-to-organizing-an-academic-workshop-cc9a5b1c32c9")[_Hitchhiker's Guide to Organizing an Academic Workshop_] if you're interested.
] #sorry

#further-reading[
  - #link("https://vlsicad.ucsd.edu/Research/Advice/network.html")[Networking on the Network] (Phil Agre) --- The best, least sleazy guide to building real professional relationships in academia.
  - #link("https://medium.com/@jennwv/nine-things-i-wish-i-had-known-the-first-time-i-came-to-nips-b939330661ed")[Nine things I wish I had known before my first NeurIPS] (Jennifer Wortman Vaughan) --- Practical survival guide for giant CS conferences.
  - #link("https://facct-blog.github.io/2025-06-22/newcomers")[Tips for first-time FAccT attendees] --- Great concrete checklist for planning sessions and approaching people.
  - #link("https://cra.org/cra-wp/grad-cohort-workshops/")[CRA-WP Grad Cohort Workshops] & #link("https://www.sigplan.org/PAC/")[SIGPLAN PAC] --- Mentoring networks and student travel funding examples.
]

// ----------------------------------------------------------------------------
// CHAPTER 14
// ----------------------------------------------------------------------------
= Teaching, TAing, and Mentoring Undergrads <ch:teaching>

#chapter-opener([Even if your department doesn't require you to TA, do it once or twice---and definitely mentor undergraduates. Nothing tests whether you truly understand a subject like explaining it to someone else.])

#simpsons[Those who can't do, teach. And those who can't teach, teach gym.]

Some PhD students treat a #gls("GTA") assignment like a prison sentence that steals time from their precious #gls("GRA") research. That's short-sighted. Yes, TAing every single semester for five years can slow down your research. Doing it *strategically* once or twice---and mentoring undergrad researchers in your lab---pays huge dividends.

== How to Be a Good TA Without Letting It Eat Your PhD

Even at universities with no formal TA requirement (like CS\@GMU), I still strongly encourage my PhD students to TA at least once or twice:
- If you have *any* interest in a faculty career (R1 or teaching-track), hiring committees want evidence that you can actually teach and communicate with students.
- Practically, taking a departmental #gls("GTA") for a Fall or Spring semester can sometimes free up your advisor's grant money to support you during the Summer (or stretch lab funding for equipment and travel).

The key is *time-boxing* so TAing stays around its contracted hours (typically 15--20 hours/week) rather than ballooning to 40:

- *Align early with the instructor.* In Week 1, clarify your exact duties (grading turnaround time, office hours, lab sections, Piazza/Ed Discussion rules). Never let vague expectations turn you into a 24/7 help desk.
- *Batch your grading and answers.* Answer forum questions once or twice a day in a fixed 30-minute block instead of leaving Ed Discussion open while you're trying to do research. Write reusable rubric comments and FAQ posts when 15 students hit the exact same bug.
- *Be kind, firm, and transparent.* Explain *why* points were deducted cleanly, don't get dragged into emotional grade-grubbing arguments (escalate persistent disputes to the professor---that's what they're paid for), and never improvise answers when you're unsure; saying *"Let me double-check that and post on the forum tonight"* beats giving wrong info.
- *Ask to give 1--2 guest lectures.* If you are considering faculty jobs later, ask the instructor if you can cover a lecture when they travel and give you direct feedback afterward. #sorry

== Mentoring Undergraduates <sec:mentoring-undergrads>

One of the most rewarding (and underrated) parts of a CS PhD is mentoring undergraduate researchers in your lab.

#figure(
  image("files/phd100404s.png", width: 80%),
  caption: [How *not* to mentor undergraduate researchers. Give them real problems, not busywork. Source: #link("https://phdcomics.com")[PhD Comics] (© Jorge Cham).],
) <fig:undergrads>

Many PhD students either ignore undergrads (*"It's faster if I just do it myself"*) or only hand them boring cleanup chores. Both miss out on how capable good undergrads actually are.

#from-roars(title: "From the ROARS Lab: Treat Undergrads Like PhD Students")[
  I typically have 2--3 undergraduates in my lab at any time, and I *treat my undergrads as PhD students*---giving them flexibility to find solutions while pushing them *way* beyond their comfort zone.

  Look at what undergrads do when you give them real ownership:
  - *KimHao* published *9 papers at top conferences and journals* as an undergrad at UNL (and now works at Jump Trading).
  - *Linhan* started as an undergrad at UNL and continued as a PhD student at GMU.
  - *Azan*---a *first-year freshman* when joining our lab---built #link("https://cspicks.roars.dev")[CSPicks] within a single week of joining.
  - *Stefania* won GMU's Outstanding Undergraduate Research Award in 2025---I originally hired her not because of prior research, but because during COVID she started a Girls Who Code club, tutored elderly people on Zoom, and refurbished old computers for underprivileged families on her own initiative.
  - Another time, GMU faculty were complaining about a Reddit post from an undergrad who used public FOIA data to build an open-source web app identifying "easy A" classes. I was *intrigued* by the initiative and good UI, tracked him down that same evening, talked the next day, and hired him on the spot.
]

When you mentor an undergrad on part of your research:
+ *Give them a real, bounded sub-problem* with a clear 2-week starting goal.
+ *Check in briefly twice a week at first* so they don't get stuck on setup issues, then give them room to run.
+ *Offer fair co-authorship* when they contribute real work (@sec:critical-ten).
+ *Notice what you learn too:* scoping a project, delegating, and helping someone else get unstuck are the exact skills you need later as a professor or senior tech lead. #sorry

#further-reading[
  - #link("https://www.cs.jhu.edu/~jason/advice/how-to-ta.html")[How to Be a Teaching Assistant] (Jason Eisner) --- Practical, battle-tested advice on running office hours, grading fairly, and protecting your research hours.
  - #link("https://teaching.cornell.edu/teaching-resources")[Cornell Center for Teaching Innovation] --- Concrete, zero-fluff guides for designing rubrics, leading discussions, and giving guest lectures.
]

// ============================================================================
// PART V
// ============================================================================
#part-page(
  "V",
  "Milestones and Crossing the Finish Line",
  "Treating quals and proposals as momentum tools rather than bureaucracy, building a helpful committee, knowing when you're ready to graduate, and escaping the ABD trap.",
)

// ----------------------------------------------------------------------------
// CHAPTER 15
// ----------------------------------------------------------------------------
= Quals, Candidacy, and the Thesis Proposal <ch:quals>

#chapter-opener([Department milestones sound intimidating, but if your research is actually moving, quals and proposals are straightforward checkpoints.])

#simpsons[I am so smart! S-M-R-T! I mean S-M-A-R-T!]

Every CS department has its own names for milestones---*Quals*, *RPE*, *Comprehensive Exam*, *Candidacy*, *Thesis Proposal*, *Prospectus*---and students often spend way too much time stressing about them.

== Qualifying Exams

Across U.S. CS departments, #gls("quals") usually look like one of three things:
+ *Coursework breadth:* Meeting a grade bar (e.g., B+ or A-) across several core breadth areas.
+ *Written/oral exam on a reading list:* Passing a broad exam on core CS subjects or papers.
+ *Research-paper/comprehensive exam:* Writing a paper describing your research area and problem and presenting it to a faculty committee (this is how CS\@GMU does it).

#from-roars(title: "From the ROARS Lab: Submit a Paper Before Quals")[
  At GMU, the comprehensive exam is quite straightforward---you write a paper describing your research area and problem and present it.
  While the exam itself is mostly a formality, I typically *won't* let my students take quals without having a paper submitted first.
  It serves as a real checkpoint that you are on track and have a clear research direction---and it means you aren't writing throwaway prose that never gets published.
]

#other-labs[
  If your department has a hard calendar deadline for quals (e.g., end of Semester 3 or Year 2) whether or not you have submitted a paper, obviously don't miss the department deadline! Check your handbook early and align your first research project so it doubles as your quals paper.
] #sorry

== Building Your Dissertation Committee

Around Year 3 or 4, you put together your dissertation committee---usually your advisor plus 3--4 other faculty members (often 2--3 from CS and 1 external member from another department, another university, or an industry research lab).

Don't pick committee members randomly at the last minute. They approve your #gls("proposal") and #gls("dissertation"), and they are often the people writing your extra recommendation letters when you go on the job market:
+ *Check with your advisor first.* Your advisor knows department dynamics you don't---including which two faculty members don't get along and might turn your proposal into an argument with each other.
+ *Pick people who know you and care about your topic.* Collaborators, professors whose seminars you did well in, or researchers in adjacent areas.
+ *Avoid unpredictable perfectionists unless your advisor says they're fine.* A committee member who demands two extra years of side experiments right before graduation is a headache you don't need.
+ *Give them drafts early.* Send your proposal or dissertation at least 2--3 weeks ahead, not three days before the meeting. #sorry

== The Thesis Proposal (And Candidacy)

Your #gls("proposal") is basically an agreement with your committee: here is the problem, here is the work I've already finished (usually 2--3 published or submitted papers), and here is the *specific remaining work* I will finish to graduate.

#polite-vs-real(
  [The dissertation proposal outlines an ambitious multi-year vision for advancing the frontiers of your discipline.],
  [A good thesis proposal is about 70% *already done* and 30% *concrete, low-risk finishing work* you can realistically complete in 6--12 months. Don't promise three risky moonshots in your proposal, or your committee may hold you to them before signing your diploma.],
)

Passing your proposal advances you to #gls("candidacy"), which often reduces tuition charges on your advisor's grant and puts you in the final stretch. #sorry

#further-reading[
  - #link("https://mitcommlab.mit.edu/eecs/commkit/thesis-proposal/")[Thesis Proposals] (MIT EECS CommKit) --- Crisp breakdown of how to structure a proposal document and talk.
  - #link("https://www.eecs.mit.edu/academics/graduate-programs/materials-and-forms-for-graduate-students/phd-academic-progress-i/")[MIT EECS Road to the PhD] & #link("https://eecs.berkeley.edu/timeline/")[Berkeley EECS Timeline] --- Clear examples of how major programs sequence milestones.
  - #link("https://gradschool.cornell.edu/academic-progress/degrees-fields/research-degree-requirements/thesis-dissertation/")[Cornell Thesis & Dissertation Resources] --- Helpful administrative checklist template to compare against your own school's graduate office.
]

// ----------------------------------------------------------------------------
// CHAPTER 16
// ----------------------------------------------------------------------------
= The Dissertation, Defense, and Knowing When to Graduate <ch:dissertation>

#chapter-opener([You are not ready to graduate when you hit "Year 5" or "4 papers." You are ready to graduate when you can conceive, execute, write, and publish top-tier research without your advisor holding the steering wheel.])

#simpsons[All right, brain. You don't like me and I don't like you, but let's just do this and I can get back to killing you with beer.]

At some point in Year 4 or 5, you start wondering the question every senior PhD student asks in the shower: *"Am I done yet?"*

== The Real Graduation Test <sec:graduation-test>

Students often want a simple rule: *"How many papers do I need to graduate?"*

In SE/PL/FM, a typical graduating student has around 4--5 publications (students in ROARS often have more---Guolong published 8 during his PhD, and Hai already had 7 by his 4th year). In systems or hardware, 2--3 major papers can be a fantastic PhD. In ML/CV, students sometimes have 6--10+.

In short, there isn't one universal paper count. What actually matters is independence:

#from-roars(title: "From the ROARS Lab: How I Know You Are Ready to Graduate")[
  I do *not* decide when a student is ready to graduate by a fixed number of years or papers.
  I know you are ready when *you can write and publish top papers independently without much revision or editing from me*---and when you know more about your area than I do. At that point, I have done my job.
]

Talk explicitly with your advisor about a graduation timeline 12--15 months before you want to leave so both of you agree on the remaining milestones. #sorry

== Writing the Dissertation (The "Staple + Glue" Reality)

In Computer Science, almost nobody writes a brand-new 200-page book from scratch in Year 5.
A typical CS #gls("dissertation") combines your 3--5 related published (or submitted) papers into one document:
+ *Chapter 1 (Introduction):* The unifying story connecting your papers (even if you only figured out the clean overarching story in Year 5---almost everyone does that).
+ *Chapter 2 (Background & Related Work):* Shared notation and context.
+ *Chapters 3--6 (Your Papers):* Unified notation, plus any extra proofs, engineering details, or negative results that didn't fit in conference page limits.
+ *Final Chapter (Conclusion & Future Work):* What you solved and what remains open.

#caution-block[
  *Check copyright and reuse rules before pasting published papers in.* ACM, IEEE, and Springer almost always let authors reuse their own papers in a dissertation, though they may require a credit line or quick permission step (and for co-authored chapters, clearly state your own role). Check the University of Michigan Library's #link("https://guides.lib.umich.edu/dissertationcopyright/publishing")[_Copyright for Dissertations_] guide and your own university library's formatting checklist a month early---graduate schools are notoriously picky about margins and title pages.
] #sorry

== Defending Without Drama

Something most advisors won't say out loud until the week before: *if your advisor lets you schedule your thesis defense, you are almost certainly going to pass.*
No sensible advisor puts a student up for a public defense to fail in front of the department; the real quality check already happened through your papers, proposal, and advisor pre-reads.

#figure(
  image("files/xkcd_thesis_defense.png", width: 52%),
  caption: [You will not actually need a broadsword. Usually. Source: #link("https://xkcd.com/1403/")[xkcd \#1403] (CC BY-NC 2.5).],
) <fig:defense>

Still, prepare properly:
- Send the complete dissertation draft to your committee 2--3 weeks early.
- Make your 45-minute public talk clear for a general CS audience (plus any family or friends attending).
- Expect probing big-picture questions in the closed-door committee session (*"What are the real limits of this approach?"*, *"What would you do differently now?"*).
- Leave 2--4 weeks after the defense for minor edits, signatures, and the graduate school's formatting check. #sorry

== The ABD Trap: Do NOT Leave Before Defending <sec:abd-trap>

Every year, strong 5th-year students get a great industry job offer and think: *"I already have my papers! I'll start work in June, finish writing on weekends, and fly back to defend in the fall."*

Don't do it.

#polite-vs-real(
  [Some doctoral candidates transition to full-time employment as ABD and complete their dissertation remotely.],
  [Once you start a full-time job, your new team takes all your energy, your manager doesn't care about Chapter 4, your advisor moves on to active students in the lab, and "writing on weekends" turns into 18 months of stress---or quietly never finishing at all. Push your start date back two months, defend *before* Day 1 of your job, and leave with your PhD done.],
) #sorry

#further-reading[
  - #link("https://guides.lib.umich.edu/dissertationcopyright/publishing")[Copyright for Dissertations] (Univ. of Michigan Library) --- Saves you from accidental publisher copyright headaches when reusing your own papers.
  - #link("https://gradschool.cornell.edu/academic-progress/degrees-fields/research-degree-requirements/thesis-dissertation/")[Thesis and Dissertation Resources] (Cornell) --- Good reference checklist for committee prep and final filing.
  - #link("https://www.cs.unc.edu/~azuma/hitch4.html")[So Long, and Thanks for the PhD] (Ronald T. Azuma) --- Especially strong on the psychology of pushing across the final finish line.
]

// ============================================================================
// PART VI
// ============================================================================
#part-page(
  "VI",
  "Internships, Money, and Life After the PhD",
  "Choosing internships that accelerate your thesis, navigating fellowships and F-1 work rules, and making an unfiltered decision about academia, industry, or postdocs.",
)

// ----------------------------------------------------------------------------
// CHAPTER 17
// ----------------------------------------------------------------------------
= Internships, Fellowships, and Practical Logistics <ch:internships>

#chapter-opener([A great summer research internship pays twice as much as your stipend, teaches you how problems look at real scale, and can hand you both a dissertation chapter and a full-time job offer.])

#simpsons[Money can be exchanged for goods and services.]

Somewhere around Year 2 or 3, you will start seeing peers post "Excited to announce I'm joining Lab X this summer!" on LinkedIn. Should *you* do internships? When? And what about fellowships and visa paperwork?

== Research Internships vs. Engineering Internships

First, understand the difference---because it matters enormously for your PhD:
- *Research Internships* (e.g., at Meta/FAIR, Google DeepMind/Research, Microsoft Research, AWS Automated Reasoning, Nvidia Research, IBM Research, Adobe Research, or U.S. government/national labs via #link("https://orise.orau.gov/internships-fellowships/graduates.html")[ORISE] or #link("https://www.nsf.gov/tip/intern")[NSF INTERN]): You are paired with a research scientist, work on an open-ended problem, and usually aim to submit a *publishable paper* (and often open-source code) by the end of the summer.
- *Software Engineering (SWE) Internships:* You join a product team, ship production code, and make great money---but you rarely get a paper out of it, and the code stays locked inside the company.

#from-roars(title: "From the ROARS Lab: Do Research Internships---and Align Them With Your Thesis")[
  I strongly encourage my students to do summer internships (for example, Hai interned at Amazon AWS and KimHao interned twice at Facebook). Not only does it save my grant money for the summer, it gives you real-world experience, external mentors, and a massive advantage on the job market.

  My strong preference for PhD students is *research internships* that connect to your dissertation area and lead to publications you can actually use in your thesis. Still, if you genuinely want to do an engineering internship to explore industry or save money, I support that too---just be honest with yourself about how it affects your graduation timeline.
]

#paragraph[Timing and Applying Smartly][
  - *Best window:* Summers after Year 2, Year 3, or Year 4. Doing an internship after Year 1 is usually too early unless you already have strong publications---use Summer 1 to get real research momentum in your own lab!
  - *Apply ridiculously early:* Big Tech research internship postings open in *September--November* for the *following summer*. If you start looking in March, 80% of the best research slots are already filled.
  - *Skip the black-hole portal alone:* Apply on the portal, *and* ask your advisor or collaborators to refer you directly to hosts they know, or email researchers whose papers you genuinely read (see the cold-email template in @app:templates). Hosting a PhD intern is a very personal match---a host who reads your paper and wants to work with you beats a generic resume drop every time.
  - *Clarify publication rights before signing.* Ask your prospective host directly whether interns on their team usually publish their summer work at conferences. Some teams publish openly; others keep everything internal. Know before accepting.
] #sorry

== Applying for Fellowships During Your PhD

Even if your advisor already covers you on a #gls("GRA"), I still encourage students to apply for fellowships (e.g., NSF GRFP if eligible early on, DoD NDSEG, industry PhD fellowships from Meta, Google, Apple, Nvidia, Microsoft, IBM, Jane Street, and university dissertation fellowships---see #link("https://github.com/dynaroars/phd-cs-us/blob/main/prospective-students.md#funding-and-fellowships")[our fellowship list] and the Fellowships chapter of #link(demystifyurl)[_PhD Demystify_]).

These fellowships aren't strictly necessary for funding, *but* they are prestigious, stand out permanently on your CV, give you extra freedom on research topics, and give you early practice writing short research proposals. (And most advisors take real pride when their students win awards---when a student wins a fellowship, it's a win for the whole lab.) #sorry

== International Students: CPT, Summer vs. Semester, and STEM OPT <sec:cpt-opt>

If you are on an *F-1 visa*, immigration rules are strict legal rules, not informal department policies. Always verify with your #gls("DSO") at the international student office instead of relying on forum posts:

+ *CPT before working off-campus:* Any off-campus internship before graduation requires #gls("CPT") approved *in advance* by your department and #gls("DSO"). Never work a single hour off-campus without authorization.
+ *Summer vs. Fall/Spring extensions:* Full-time summer CPT is standard at most CS departments. Extending an internship into Fall or Spring while enrolled as a full-time #gls("GRA") is much trickier---doing part-time GRA can void your tuition waiver and health insurance or violate visa rules. Check *both* your department and international office before agreeing to an extension.
+ *Track the 12-month full-time CPT limit:* Reaching 12 months of *full-time* CPT makes you ineligible for post-graduation #gls("OPT"). Keep track of your total days if you do multiple internships.
+ *Plan OPT and STEM OPT early:* Eligible F-1 CS graduates get 12 months of #gls("OPT") plus a 24-month #gls("STEM-OPT") when working for an E-Verify employer (see the #link("https://studyinthestates.dhs.gov/stem-opt-hub")[DHS STEM OPT Hub]). Filing opens 90 days before your program end date and processing takes time, so coordinate your defense date, graduation filing date, and job start date together. #sorry

#further-reading[
  - #link("https://www.nsf.gov/tip/intern")[NSF INTERN] & #link("https://orise.orau.gov/internships-fellowships/graduates.html")[ORISE Graduate Internships] --- Often-overlooked funded research internships in industry and U.S. government labs.
  - #link("https://studyinthestates.dhs.gov/stem-opt-hub")[DHS STEM OPT Hub] --- Official government rules on STEM OPT eligibility and employer requirements.
  - #link("https://web.archive.org/web/20260817180455/https://colinraffel.com/blog/writing-a-google-ai-residency-cover-letter.html")[Writing a Research Residency Cover Letter] (Katherine Lee & Ben Eysenbach) --- Concrete examples of pitching yourself cleanly to top industry research programs.
]

// ----------------------------------------------------------------------------
// CHAPTER 18
// ----------------------------------------------------------------------------
= Deciding What Comes Next <ch:careers>

#chapter-opener([Most CS PhDs do not become professors---and that is completely fine. Pick the career you actually want, not the one you think will impress your advisor.])

#simpsons[Well, it's not quite a mop, it's not quite a puppet, but man... so to answer your question, I don't know.]

Because your advisor is a professor, it is easy during a PhD to absorb the unspoken idea that becoming an R1 professor is the only "real" success and going to industry is settling.
Look at the actual numbers first.

#figure(
  statbar((
    ([Industry (North America)], 54, rgb("#2563eb")),
    ([Academia (TT, Postdoc, Teaching)], 39, olive),
    ([Government / Other / Searching], 7, rgb("#6b7280")),
  ), max: 65),
  caption: [Where new North American CS PhDs actually go (2024 #link("https://cra.org/resources/taulbee-survey/")[CRA Taulbee Survey]). Industry has consistently been the majority destination for CS PhDs.],
) <fig:taulbee>

More than half of new CS PhDs go to industry. Plenty of strong researchers would hate writing grants and sitting on faculty committees, and plenty of professors would hate having their research direction cancelled in a corporate re-org. Be honest with yourself about what kind of daily work you actually enjoy.

== The Five Main Post-PhD Paths

#paragraph[1. R1 Tenure-Track Professor][
  The big draw is freedom---especially once you get tenure, you pick the problems you care about, build a lab, mentor students, and don't worry about layoffs when a company has a bad quarter.
  The trade-off is real too: the hiring market is very competitive, the first six years before tenure are intense (juggling grants, teaching, advising, and service), you usually don't get to pick your exact city, and cash pay is much lower than Big Tech.
  It's a great job if you genuinely enjoy mentoring students, writing papers and grants, and trading top salary for long-term autonomy.
]

#paragraph[2. Teaching-Track Faculty or Primarily Undergraduate Institution (PUI)][
  If you discovered during your #gls("GTA") semesters that you enjoy teaching classes and mentoring undergrads much more than chasing grants and conference deadlines, teaching-track roles at R1s or faculty jobs at PUIs can be a great fit. Expect heavier teaching loads (often 2--3+ courses per semester) and much less PhD-student research support, with far less grant pressure.
]

#paragraph[3. Industry Research Labs (Research Scientist / Applied Scientist)][
  Good pay, huge compute and real-world data, strong colleagues, and no teaching or grant writing---and at the best labs, you still publish at top conferences.
  The catch is that industry priorities shift fast with re-orgs and hype cycles, there is no tenure, and "Research Scientist" at some companies really means "ML Engineer with a PhD." Always ask interviewers how much time is genuinely research vs. product support, and whether teams actually publish.
]

#paragraph[4. Industry Engineering, Quant Finance, & Startups][
  Top pay, fast feedback loops, geographic flexibility, and building systems that millions of people use.
  You probably won't use your exact dissertation topic directly, which is totally fine---you are using the broader skills from the PhD (working independently, solving hard unfamiliar problems, writing clearly, enduring ambiguity). Many of my former students (including MS/undergrad alums) went this route and are doing great.
]

#paragraph[5. Postdoc: Launchpad or Holding Pattern? <sec:postdoc>][
  A #gls("postdoc") (1--2 years) isn't required in most CS areas, though it has become more common in competitive areas like theory, PL, systems, and AI/ML.
  A postdoc makes sense if you want an R1 faculty job and need 1--2 more strong papers or a broader network, if you want to pivot into an adjacent subfield (my own postdoc with Jeff Foster in UMD's PLUM lab was huge for my career), or if you're solving a two-body location problem.
  Just don't drift into back-to-back postdocs simply because you're nervous about going on the job market.
]

#figure(
  image("files/xkcd_survivorship_bias.png", width: 38%),
  caption: [Whenever you read career advice from a professor or founder (including me), keep survivorship bias in mind. Source: #link("https://xkcd.com/1827/")[xkcd \#1827] (CC BY-NC 2.5).],
) <fig:survivorship> #sorry

== Start Preparing 12--18 Months Early

Whatever track you pick, don't wait until the spring you want to graduate:
- *For Faculty Jobs:* Universities hire in the *Fall* (apply in Fall of Year $X - 1$ for a Fall of Year $X$ start; interviews happen in Spring of Year $X$). You can graduate in Spring or Summer, and it's common to negotiate starting a semester or a year later. Instead of manually checking 100 department websites, use #link("https://cspicks.roars.dev/jobs.html")[CSPicks Faculty Jobs] (which crawls official university postings worldwide, including teaching-track roles and visa sponsorship notes), and check our companion guide at #link("https://github.com/dynaroars/phd-cs-us/blob/main/faculty-applications.md")[faculty-applications.md].
- *For Industry Jobs:* Use internship return offers and referrals from collaborators and lab alumni. If you're interviewing for SWE or Applied Scientist roles, practice coding and system/ML design interviews two months ahead---strong papers don't save you if you freeze on a live coding screen.
- *One blunt warning for interviews (especially campus visits):* Anything you say all day---even casually during lunch or dinner---can work for or against you. Stay sharp, stay respectful, and don't let your guard down over dinner and say something careless that raises a huge red flag.

#tip-block[
  Talk to 3 recent alumni from your lab or department---one in academia, one in an industry research lab, and one in industry engineering. A 20-minute candid call with someone two years ahead of you beats reading fifty anonymous forum threads.
] #sorry

#further-reading[
  - #link("https://github.com/dynaroars/phd-cs-us/blob/main/faculty-applications.md")[Faculty Job Search Guide] --- Our companion directory covering faculty tracks, statements, job talks, chalk talks, and startup negotiation.
  - #link("https://csguides.github.io/grad-job-guide/")[CS Graduate Job and Interview Guide] (Wes Weimer et al.) --- Terrific open-source guide covering R1, liberal arts, and industry research job hunts.
  - #link("https://people.engr.tamu.edu/rabi/N%20Things.PDF")[The N Things I Wish I Knew Before the Job Search] (Maria Ebling et al.) --- Candid practical lessons across academic and industry searches.
  - #link("https://lazowska.cs.washington.edu/jobs.pdf")[The PhD Job Hunt] (Ed Lazowska) --- Classic, crystal-clear comparison of research roles across universities and industry labs.
  - #link("https://www.hachettebookgroup.com/titles/peter-j-feibelman/a-phd-is-not-enough/9780465025336/?lens=basic-books")[A PhD Is Not Enough!] (Peter J. Feibelman) --- Older physics-oriented book, still sharp on thinking strategically about a research career.
]

// ============================================================================
// APPENDICES
// ============================================================================
#part-page(
  "VII",
  "Toolkits, Templates, and Reference",
  "Year-by-year sanity checklists, blunt email & rebuttal templates, the ten external links worth reading first, and a current-student glossary.",
)

// ----------------------------------------------------------------------------
// APPENDIX A
// ----------------------------------------------------------------------------
#counter(heading).update(0)
#set heading(numbering: "A.1.")
#show heading.where(level: 1): set heading(supplement: [Appendix])
= Year-by-Year Sanity Checklists <app:checklists>

#chapter-opener([Inspired by Aaditya Ramdas's checklists: not a rigid law, just a quick annual gut-check to make sure you aren't silently drifting.])

#set list(marker: [☐])

== Year 1: Unlearn Undergrad and Get Moving
- Read your department's Graduate Handbook once (credit rules, quals deadline, funding fallback).
- Have an explicit expectation-setting chat with your advisor (@ch:advisor, @app:templates).
- Set up your core tooling: Git, Zotero (or bibliography manager), #gls("ORCID"), LaTeX/Typst, and cluster/GPU access (@ch:engineering).
- Pass your core courses cleanly *without* sacrificing research to chase a 4.0 GPA (@sec:gpa-trap).
- Clone, run, and break the main open-source baseline in your area (@ch:break-first).
- Join a senior student's project or scope a starter project---aim for your first submission (even as second author) by the end of Year 1 or early Year 2.
- Bookmark campus health, counseling, advocacy, and international student office (DSO) resources before you ever need them.

== Year 2: Ship Your First Paper and Confirm Fit
- Submit (and ideally publish) at least one paper at a real venue---second author is solid; first author means you are ahead.
- Confirm honestly that your advisor and research direction fit you; if they truly don't, switch *now* rather than Year 4 (@sec:switching-advisors).
- Pass (or schedule) your #gls("quals")---ideally anchored around a real paper submission (@ch:quals).
- Attend at least one conference, workshop, or summer school and meet 5+ peers outside your university (@ch:conferences).
- Apply for external fellowships if eligible (@ch:internships).
- Practice your first sub-review or #gls("shadow-pc") review (@ch:reviewing).

== Year 3: Own Your Line of Work
- Submit 1--2 *first-author* papers to #gls("toptier") (if you finish Year 3 with zero strong first-author submissions, stop and do an honest reset with your advisor).
- Pitch at least one project idea that *you* originated---backed by a small working prototype (@sec:managing-up).
- Do your first summer research internship (apply in Fall of Year 2/3, and file #gls("CPT") early if on F-1).
- TA once or twice if useful for your goals, and try mentoring an undergrad on a well-scoped sub-problem (@ch:teaching).
- Build a clean personal website showcasing your papers, open-source tools, and talks.

== Year 4: Become the Expert and Lock In Candidacy
- Assemble a supportive dissertation committee and pass your #gls("proposal") to reach #gls("candidacy") (@ch:quals).
- Notice that you know more about your specific sub-problem than your advisor---and start writing paper drafts that need minimal advisor surgery (@sec:graduation-test).
- Cultivate 2--3 external letter writers (collaborators, internship hosts, committee members) who know your research deeply.
- Talk to 3+ recent alumni across academia, industry research, and engineering to decide what track you actually want (@ch:careers).
- Have an explicit "graduation timeline" conversation with your advisor 12--15 months before your target defense.

== Year 5+: Finish Strong and Do Not Get Stuck ABD
- Apply for jobs on the right calendar (Fall for tenure-track/postdoc; Fall--Winter for industry research/engineering).
- Draft your dissertation early by unifying your published papers (verify publisher copyright permissions and grad-school formatting rules a month early).
- Send the complete dissertation draft to your committee 2--3 weeks before the defense.
- *Defend before starting your full-time job* (@sec:abd-trap).
- If on F-1, align defense date, graduation date, #gls("OPT") filing window, and job start date with your #gls("DSO").
- Hand off lab code/servers cleanly, thank the people who helped you, and go celebrate. #sorry

#set list(marker: ([•], [‣], [–]))

// ----------------------------------------------------------------------------
// APPENDIX B
// ----------------------------------------------------------------------------
= Practical Templates and Scripts <app:templates>

#chapter-opener([Skeletons, not copy-paste scripts. Keep them short, blunt, and specific to your situation---professors and researchers can spot robotic boilerplate from a mile away.]) #sorry

#block(breakable: false)[
== Advisor Expectation-Setting Agenda (Semester 1)

Send this short list a day before your expectation-setting chat (@ch:advisor):

```
Hi <Advisor>,

Before the semester gets busy, could we spend 20 minutes aligning on how we
work together best? Here are a few quick things I'd love to clarify:

1. Meetings & updates: Preferred cadence (weekly 1:1, lab meeting, or ad-hoc)
   and how you like updates (Discord/Slack, email, shared doc).
2. Milestones: What does "good progress" look like for me by the end of Year 1
   and Year 2 (papers, quals, coursework)?
3. Writing & feedback: How early do you want to see paper drafts or experiment
   results?
4. Practical stuff: Summer funding expectations, ideal timing for internships,
   and how much notice you prefer for time off.

Thanks,
<Name>
```
]

#block(breakable: false)[
== "I'm Stuck" Update (Proactive, Not Passive)

Never vanish for three weeks when stuck, and never dump an unresearched question on your advisor either:

```
Hi <Advisor>,

I've been stuck for two days trying to get <method X> to converge on
<benchmark Y>.

What I tried:
- Approach A: failed with <concrete error / metric>.
- Approach B: fixed <issue>, but runtime blew up by 10x because of <reason>.

My next guess is trying <Approach C>, though I'm worried it breaks <assumption>.
Could we chat for 15 minutes tomorrow to sanity-check this before I sink
another week into C?

Thanks,
<Name>
```
]

#block(breakable: false)[
== Pitching an Unconventional Side Idea (With a Prototype)

Remember the rule from @sec:managing-up: *don't pitch vaporware---bring receipts.*

```
Hi <Advisor>,

Quick update on <Main Project>: <one sentence showing main work is on track>.

On the side, I've been testing a slightly different idea for <Problem Z>. I
built a small prototype over the weekend and ran it on <small benchmark>:
- Baseline: <number>
- Prototype: <better number / surprising finding>

The code and a 1-page writeup with plots are here: <link>. If you think this
has legs, I'd love to spend 10 minutes after lab meeting discussing whether it's
worth pushing toward <Venue>.

Thanks,
<Name>
```
]

#block(breakable: false)[
== Switching Advisors Professionally

Only send this *after* you have quietly confirmed a new advisor and funding plan (@sec:switching-advisors), and ideally right after (or to schedule) an in-person/Zoom conversation:

```
Subject: Meeting to discuss my research direction

Hi <Current Advisor>,

Thank you for your guidance and support over the past <year / two semesters>.
I've learned a lot working on <project> in the lab.

Over the past few months, I've realized my research interests have shifted
strongly toward <New Area>, and I'd like to transition to working with
Prof. <New Advisor> starting <Next Semester> so my dissertation aligns with
that direction.

I want to make sure the transition is smooth and responsible: I'm committed to
documenting and handing off <code/experiments> cleanly and finishing my agreed
part of <in-progress paper, if applicable>. Could we meet this week to coordinate
a clean handoff?

Thank you again for everything you've taught me.

Best,
<Name>
```
]

#block(breakable: false)[
== Rebuttal Skeleton (Calm, Specific, Zero Defensiveness)

Adapt to your venue's format (global response + per-reviewer responses, @sec:rebuttal-rules):

```
We thank the Area Chair and all reviewers for their thoughtful, constructive
feedback. Below we address the main shared questions first, followed by
specific points for each reviewer.

=== Common Points ===
[C1. Extra baseline / ablation (R1, R3)]
We ran <Baseline X> under identical hardware/timeout settings. Results across
all 5 benchmarks:
| Method     | Metric A | Runtime |
| Baseline X |   ...    |   ...   |
| Ours       |   ...    |   ...   |
We will include this table and analysis in Section 5.2.

=== Reviewer 1 ===
- Q1 (Clarification of Assumption 2): Thank you for catching this ambiguity.
  Assumption 2 only requires <exact condition>, not <stronger condition>. We
  will state this explicitly in Section 3.1 and add a short concrete example.
- Q2 (Runtime overhead): In our experiments, preprocessing accounts for <X%>
  of total time; <1-sentence explanation>.

=== Reviewer 2 ===
- Q1 (Comparison to [Smith 2024]): We agree [Smith 2024] is closely related.
  The key technical difference is <1 concrete difference>, which enables
  <concrete advantage>. We will add this discussion to Related Work.
```
]

#block(breakable: false)[
== Cold Email to a Potential Research Internship Host

Send in September--November for the following summer (@ch:internships). Keep it under 150 words:

```
Subject: Summer 2027 Research Intern Inquiry --- <Specific Topic>

Hi Dr. <Lastname>,

I'm a <3rd>-year CS PhD student at <University> advised by <Advisor>. I really
enjoyed your team's recent <Venue> paper "<Title>"---especially how you solved
<one concrete technical detail>.

My research focuses on <1 sentence>, and I recently published <Paper / Tool>
at <Venue> (<1-line headline result + GitHub/paper link>). I think my work on
<X> connects directly to <Y> on your team, and I'd love to explore a Summer
2027 research internship with your group.

I've attached my CV (and already submitted via the portal, req #<ID> if
applicable). Would you have 15 minutes for a quick chat if you're hosting
interns this summer?

Best,
<Name>
<Personal website / Google Scholar>
```
]

#block(breakable: false)[
== Inviting a Faculty Member to Your Dissertation Committee

Send at least 6--8 weeks before your proposal, *after* confirming the list with your advisor (@ch:quals):

```
Subject: Invitation to serve on my PhD dissertation committee

Dear Prof. <Lastname>,

I am a <4th>-year CS PhD student advised by <Advisor>, planning to propose my
dissertation in <Month/Year>. My thesis focuses on <1-2 sentences describing
the core problem and published work so far>.

Given your expertise in <their specific area> (and how helpful your
<course / feedback / collaboration> was), both <Advisor> and I would be honored
if you would serve on my dissertation committee.

I plan to share the proposal draft by <Date, 2-3 weeks before> and aim to hold
the proposal defense during <Window>. Please let me know if your schedule
permits, and no worries at all if you're overcommitted this semester.

Thank you very much,
<Name>
```
]

// ----------------------------------------------------------------------------
// APPENDIX C
// ----------------------------------------------------------------------------
= The Shortlist (Read These 10 First) <app:reading>

#chapter-opener([Our companion repository lists over 70 links for current CS PhD students. Nobody reads 70 links. Start with these ten, and use the full list when you hit a specific problem.])

If you only have one rainy weekend to read external PhD advice, skip the endless threads and read these ten:

+ *#link("https://matt.might.net/articles/phd-school-in-pictures/")[The Illustrated Guide to a PhD]* (Matt Might) --- Two minutes; fixes your mental model of what a PhD contributes.
+ *#link("https://karpathy.github.io/2016/09/07/phd/")[A Survival Guide to a PhD]* (Andrej Karpathy) --- Practical, honest overview of the full CS PhD arc.
+ *#link("https://www.cs.virginia.edu/~robins/YouAndYourResearch.html")[You and Your Research]* (Richard Hamming) --- Unmatched cure for working on tiny, boring problems.
+ *#link("https://web.stanford.edu/class/cs245/readings/how-to-read-a-paper.pdf")[How to Read a Paper]* (Srinivasan Keshav) --- The 3-pass method that stops you from drowning in PDFs.
+ *#link("http://joschu.net/blog/opinionated-guide-ml-research.html")[An Opinionated Guide to ML Research]* (John Schulman) --- Best guide anywhere on debugging research ideas and knowing when to pivot.
+ *#link("https://www.cs.jhu.edu/~jason/advice/write-the-paper-first.html")[Write the Paper First]* (Jason Eisner) --- Turns writing from a last-minute chore into a research compass.
+ *#link("https://billf.mit.edu/wp-content/uploads/2014/02/cvprPapers.pdf")[How to write a good CVPR submission]* (Bill Freeman) --- Punchy, concrete writing rules that apply across all of CS.
+ *#link("https://engineering.purdue.edu/ChanGroup/write_review.html")[How to write a reviewer report]* (Stanley Chan) --- Makes you both a fairer reviewer and a sharper author.
+ *#link("https://homes.cs.washington.edu/~mernst/advice/giving-talk.html")[How to give a technical presentation]* (Michael Ernst) --- Everything you need so nobody checks their phone during your talk.
+ *#link("https://csguides.github.io/grad-job-guide/")[CS Graduate Job and Interview Guide]* (Wes Weimer et al.) --- Grounded roadmap when it's time to leave the nest.

For the complete, continuously updated index---including personal PhD reflections by Jean Yang, Peter Bailis, Adam Marcus, and Chris Martens, plus university policies, fellowship directories, and faculty job-market resources---visit:
- #link("https://github.com/dynaroars/phd-cs-us/blob/main/current-students.md")[Current PhD Students Resource Index]
- #link("https://github.com/dynaroars/phd-cs-us/blob/main/faculty-applications.md")[Faculty Applications Guide]
- #link("https://github.com/dynaroars/phd-cs-us/blob/main/faculty-resources.md")[Faculty Resources] (for when you survive this book and start your own lab!) #sorry

// ----------------------------------------------------------------------------
// ABOUT & DISCLAIMER
// ----------------------------------------------------------------------------
#set heading(numbering: none)
= About This Book <ch:about>

== Why I Wrote This

This book is the companion volume to #link(demystifyurl)[_Demystifying PhD Admissions in Computer Science_] and an expansion of the lessons inside my #link(advisingurl)[_ROARS Lab Advising Guide_]. Just like *PhD Demystify*, it started as a personal project---often written as "productive procrastination" around deadlines---because I kept answering the exact same questions for PhD students over Discord, in hallway chats, and online.

Most students from elite labs absorb the unwritten rules of CS research by osmosis. First-generation students, international students, and students in smaller departments often have to guess those rules through painful trial and error. My goal is to put the real playbook out in the open, for free, forever.

== About Me

I am a tenured Associate Professor of Computer Science at George Mason University (GMU), where I lead the #link("https://roars.dev")[ROARS Lab] working on Software Engineering, Formal Methods, Program Analysis, Neural Network Verification, and theorem proving (Lean 4). Before GMU, I was faculty at the University of Nebraska--Lincoln (UNL), a postdoc in the PLUM Lab at the University of Maryland (with Jeff Foster), and a PhD student at the University of New Mexico (with Stephanie Forrest and the late Deepak Kapur) after earning my BS and MS at Penn State. Outside academia, I worked at the Naval Research Lab and Lockheed Martin. I was the first person in my family to go to college and earn a PhD.

== Disclaimer <sec:disclaimer>

This book is #highlight[_subjective, blunt, and unapologetically opinionated_]. I believe candid, concrete advice---even when you disagree with parts of it---is infinitely more useful than hedged, committee-approved fluff that tells you nothing.

Because CS subfields, universities, and advisors vary enormously, treat this book as a sharp starting point, not gospel. Notice where your advisor or subfield operates differently (that's why the *Different Advisor, Different Lab* boxes exist), talk openly with your own mentors, and take ownership of your own decisions.

== Contributing

This book is open-source at #link(mybookgithub)[#mybookgithub]. If you spot a typo, a broken link, or a perspective from another CS subfield (theory, hardware, HCI, systems, security) that deserves a *Different Advisor, Different Lab* box, open an issue or pull request on GitHub. #sorry

// ----------------------------------------------------------------------------
// GLOSSARY
// ----------------------------------------------------------------------------
= Glossary <ch:glossary>

#text(size: 10.2pt)[
  #print-glossary(entry-list, show-all: true)
]

#v(1.2em)
#emph-block[#align(right)[_Last Updated: *#datetime.today().display("[year]-[month]-[day]")*_]]
