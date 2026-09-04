#set text(
  //font: "Noto Serif",
  
  //font: "TeX Gyre Pagella",
  size: 12pt
)

#set page(numbering: "1", number-align: center)
#set heading(numbering: "1.")
#set par(justify: true)

#set list(indent: 1em)
#set enum(indent: 1em)
#show heading: set block(below: 1.5em, above: 1.5em)

#show ref: set text(fill:blue)
#show link: set text(fill:blue)
#show link: underline
#show figure.caption: set text(size: 10pt)

// Inline code
#show raw.where(block: false): it => box(fill: rgb("#f0f0f0"), inset: (x: 2pt), radius: 2pt, it)

// Code blocks
#show raw.where(block: true): it => block(
  fill: gray.lighten(80%),
  inset: 10pt,
  radius: 5pt,
  width: 100%,
  text(size: 0.85em, it)
)

#let mytitle = "Demystifying PhD Admissions in Computer Science"
#let mysubtitle = "A Handbook for Navigating CS PhD Admissions in the U.S."
#let me = "ThanhVu (Vu) Nguyen"
#let institute = "George Mason University"
#let mybookgithub = "https://code.roars.dev/phd-cs-us"



#let alert(txt) = {highlight(fill:red.lighten(30%))[#txt]}
#let paragraph(title, body) = {
  v(0.5em)
  text(weight: "bold", style: "italic")[#highlight(fill:gray.lighten(80%))[#title] ]
  body
}

#let simpsons(s) = quote(
    attribution: [#text(size:0.85em)[*The Simpsons* 😱]],
    block:true
  )[
      #text(style:"italic", size:0.85em)[#s]
  ]

// Chapter-opening pull-stat: a large italic hook placed right after a chapter heading.
#let chapter-opener(stat, source: none) = block(above: 0.6em, below: 1.6em, breakable: false)[
  #text(size: 15pt, style: "italic", fill: rgb("#1a1a1a"))[#stat]
  #if source != none [
    #h(0.5em)
    #text(size: 8.5pt, fill: gray)[#source]
  ]
]

#import "@preview/theorion:0.6.0": *
//#import cosmos.simple: *
//#import cosmos.fancy: *
#import cosmos.rainbow: *
//#import cosmos.clouds: *
#show: show-theorion

#let redact(text, fill: black, height: 1em) = {
  box(rect(fill: fill, height: height)[#hide(text)])
}

// ============================================================================
// DRAFT marker for newly added sections that still need the author's review.
// Search the source for "DRAFT" (or remove the calls below) once reviewed.
// ============================================================================
#let draftbanner(note: "") = block(
  fill: rgb("#fff3cd"),
  inset: 8pt,
  radius: 4pt,
  width: 100%,
  stroke: (paint: rgb("#e0a800"), thickness: 1pt),
)[
  #text(fill: rgb("#856404"), weight: "bold", size: 0.9em)[🚧 DRAFT.]
  #if note != "" {
    linebreak()
    text(fill: rgb("#856404"), size: 0.85em, style: "italic")[Note to self: #note]
  }
]

// Compact inline marker for newly added stats/snippets (search "DRAFT" to find).
#let drafttag = box(
  fill: rgb("#fff3cd"),
  inset: (x: 3pt, y: 1pt),
  radius: 2pt,
  text(fill: rgb("#856404"), weight: "bold", size: 0.7em)[DRAFT],
)

// Simple, dependency-free horizontal bar chart for stat figures.
// data: array of (label, value, color). DRAFT additions---tweak colors/sizes to taste.
#let statbar(data, max: 100, unit: [%]) = align(center, box(width: 88%, grid(
  columns: (auto, 1fr, auto),
  row-gutter: 10pt,
  column-gutter: 8pt,
  align: (right + horizon, left + horizon, left + horizon),
  ..data.map(row => (
    text(size: 0.85em, row.at(0)),
    rect(width: row.at(1) / max * 100%, height: 0.95em, fill: row.at(2), stroke: none, radius: 1.5pt),
    text(size: 0.82em, weight: "bold", [#row.at(1)#unit]),
  )).flatten()
)))

#show figure.where(kind: image): set figure(supplement: [Fig.])
#show figure.where(kind: table): set figure(supplement: [Tab.])
//#show math.equation: set math.equation(supplement: [Eq.])
#show heading: set heading(supplement: [Sec.])


#import "@preview/glossarium:0.5.10": make-glossary, register-glossary, print-glossary, gls, glspl, gls-long, Gls
#show: make-glossary

#let entry-list = (
  (key: "April 15", description: [The #link("https://cgsnet.org/wp-content/uploads/2024/01/CGS_April15_Resolution_Jan312024.pdf")[April 15 resolution] is deadline for most US universities to accept or decline offers of admission. Students are typically not required to accept offers before this date.]),
  (key: "cohort", description: [A group of students who start a program at the same time and often take classes together.]),
  (key: "Ivy League", description: [A group of #link("https://en.wikipedia.org/wiki/Ivy_League")[eight private universities in the US] known for academic reputation and prestige.]),
  (key: "adcom members", long: "admission committee members", description: [Faculty members who review applications and make admission decisions.]),
  (key: "adcom chair", long: "admission committee chair", description: [The faculty member who leads the admission committee and oversees process fairness.]),
  (key: "advisor", long: "advisor/supervisor", description: [A faculty member who guides and mentors a PhD student throughout research.]),
  (key: "r1", short: "R1", long: "Research 1 university", description: [Universities with the highest level of research activity.]),
  (key: "stipend", description: [A fixed regular payment to students as part of their funding package.]),
  (key: "rolling admission", description: [Applications are reviewed as they arrive, with decisions released continuously.]),
  (key: "toptier", short: "top-tier venues", long: "top-tier conferences and journals", description: [Highly prestigious publication venues in a CS field.]),
  (key: "diversity-statement", description: [An application document describing contributions to diversity and inclusion.]),
  (key: "fields", short: "fields", long: "fields or research areas", description: [Specific areas of study within a discipline, such as ML, CV, or Software Engineering.]),
  (key: "international-domestic", short: "international vs domestic", long: "international vs. domestic students", description: [International students usually need a visa; domestic students do not.]),
  (key: "in-out-state", short: "in-state vs out-of-state", long: "in-state vs. out-of-state tuition", description: [Tuition categories based on state residency; often important for MS applicants.]),
  (key: "research-lab", short: "lab", long: "research lab/group", description: [A group of faculty and students working in a shared research area.]),
  (key: "major", description: [A student's primary field of study, usually in undergraduate education.]),
  (key: "open house", description: [An event where admitted students visit or attend virtually to learn about the program.]),
  (key: "AY",  long: "Academic Year", description: [The yearly academic calendar (typically Fall and Spring; sometimes Summer/quarter systems).]),
  (key: "Q1", long: "Scopus Q1 Journals", description: [A journal quartile label; less commonly used by US CS faculty than venue-specific names.]),
  (key: "RA", long: "Research Assistantship", description: [A major type of PhD funding through research work with a professor.]),
  (key: "TA", long: "Teaching Assistantship", description: [A major type of PhD funding through teaching support duties.]),
  (key: "GRE", long: "Graduate Record Examination", description: "A standardized admissions test; often optional for CS PhD programs."),
  (key: "REU", long: "Research Experience for Undergraduates", description: "An NSF-funded program offering undergraduate research opportunities."),
  (key: "SOP", long: "Statement of Purpose", description: "An application essay describing your research interests, background, and goals."),
  (key: "adcom", long: "admission committee", description: "The group of faculty members who review applications and make admission decisions."),
  (key: "phd", short: "PhD", long: "doctor of philosophy", description: "A research doctorate requiring original contributions and a dissertation."),
  (key: "ABD", long: "All But Dissertation", description: "A PhD candidate who completed coursework/exams and is finishing the dissertation."),
  (key: "PI", long: "Principal Investigator", description: "Lead researcher on a grant or project. Prospective students often refer to potential advisors as PIs."),
  (key: "STEM", long: "Science Technology Engineering and Mathematics", description: "A collective term for science, technology, engineering, and mathematics fields."),
  (key: "NSF", long: "National Science Foundation", description: "A US agency that funds research and education in science and engineering."),
  (key: "GRFP", long: "NSF Graduate Research Fellowship Program", description: "A competitive fellowship program for PhD students funded by the National Science Foundation."),
  (key: "NDSEG", long: "DoD National Defense Science and Engineering Graduate Fellowship", description: "A competitive fellowship program for PhD students funded by the US. Department of Defense."),
  (key: "LOR", long: "Letter of Recommendation", description: "A letter evaluating your qualifications and potential for graduate study."),
  // --- DRAFT: new CS PhD entries added for review ---
  (key: "dissertation", short: "dissertation", long: "dissertation (thesis)", description: [The original research document a PhD student writes and defends to earn the degree; also called a thesis.]),
  (key: "qualifying-exam", short: "qualifying exam", long: "qualifying exam (quals)", description: [An early-PhD exam testing foundational knowledge in your area; passing it lets you continue toward candidacy.]),
  (key: "candidacy", description: [The status of a PhD student who has passed required exams and is approved to work on the dissertation (a "PhD candidate").]),
  (key: "proposal", short: "proposal", long: "dissertation proposal", description: [A plan for your dissertation research, presented to and approved by your committee before you finish.]),
  (key: "defense", short: "defense", long: "thesis defense", description: [The oral presentation and examination of your completed dissertation before your committee.]),
  (key: "postdoc", description: [A temporary research position taken after the PhD, often as a step toward a faculty job.]),
  (key: "tenure-track", description: [A faculty position on the path to tenure, the long-term job security granted after a multi-year review.]),
  (key: "first-author", description: [The lead author of a paper, usually the person who did most of the work; first authorship matters a lot in CS.]),
  (key: "arxiv", short: "arXiv", long: "arXiv preprint server", description: [A widely used open-access server where CS researchers post papers, often before peer review.]),
  (key: "preprint", description: [A version of a paper shared publicly before (or without) formal peer review.]),
  (key: "peer-review", description: [Evaluation of a paper, proposal, or grant by other independent experts in the field.]),
  (key: "POI", long: "professor of interest", description: [A faculty member a prospective student would like to work with as an advisor.]),
  (key: "reach-safety", short: "reach vs. safety", long: "reach vs. safety schools", description: [Reach schools are ambitious targets; so-called safety schools are less selective, but no credible PhD program is guaranteed because admission depends on research match, funding, and capacity.]),
  (key: "waitlist", description: [A pool of qualified applicants who may receive an offer if admitted students decline theirs.]),
  (key: "deferral", short: "deferral", long: "deferred admission", description: [Postponing your admission start date, typically by up to a year, with the program's approval.]),
  (key: "assistantship", description: [A funded position---a TA or RA---that typically covers tuition, health insurance, and a stipend.]),
  (key: "F-1", long: "F-1 student visa", description: [The most common nonimmigrant visa for full-time international students in the US.]),
  (key: "CPT-OPT", short: "CPT/OPT", long: "Curricular/Optional Practical Training", description: [Work authorizations that let F-1 students work in their field---CPT during the program, OPT after.]),
)

#register-glossary(entry-list)
#set page(numbering: none)

// Title Page
#align(center)[
  #box(
    stroke: (x: 3pt + olive, y: 3pt + olive),
    inset: 1in
  )[
    #v(0.5fr)
    #text(size: 24pt, weight: "bold")[#mytitle]
    #v(1em)
    #text(size: 16pt, weight: "bold")[#mysubtitle]
    #v(1fr)
    #image("files/usamap.png", width: 100%)
    #v(1fr)
    #text(size: 18pt, weight: "bold")[#me]
    #v(0.2fr)
    #text(size: 14pt)[#institute]
  ]
]

#pagebreak()

#set page(numbering: "1")
#counter(page).update(2)

#v(1fr)
#emph-block[
    This #link(mybookgithub)[work] © #datetime.today().year() by #me is licensed under CC BY-NC 4.0. To view a copy of this license, visit #link("https://creativecommons.org/licenses/by-nc/4.0/")[creativecommons.org].
]


#pagebreak()
#outline(title: "Contents and Summary")
#pagebreak()


#heading(numbering: none)[Preface]

Having been involved in PhD admission committees for many years, I've observed that students---especially those in smaller countries, less well-known universities, or 1st generation college students---often lack a clear understanding of the Computer Science (CS) PhD admission process at US universities. This confusion not only discourages them from applying but also creates the perception that getting admitted to a CS PhD program in the US is unrealistically difficult.

// % though \emph{very} top schools could be very selective, e.g., see the \href{https://da-data.blogspot.com/2015/03/reflecting-on-cs-graduate-admissions.html}{admission process} at CMU
So I want to share some details about the admission process and advice for those who are interested in applying for a *PhD in CS in the US*.
Originally, this book was written for international students, but has been expanded to generalize and include specific tips for *US domestic students* (@chap:domestic-students), e.g., applying for the NSF GRFP (@sec:nsf-grfp) and DoD NDSEG (@sec:dod-ndseg) fellowships.
Moreover, while this book focuses on CS, it might be relevant to students from various STEM disciplines (@sec:fields-and-areas).
Furthermore, although many examples are specifics for schools that I and other contributors of this book know about, the information should apply to other good #gls("r1", first: false) institutions in the US.

This book can help *US faculty* and #gls("adcom",display: "admission committees") gain a better understanding of international students and their cultural differences (@chap:cultural).  By recognizing and leveraging these differences, CS programs in the US can attract larger and more competitive application pools from international students.

I hope this book will help you understand the CS PhD admission process in the US and make informed decisions. 
Additional information about the book can be found in @chap:about.



#pagebreak()
// \mainmatter

= Introduction <part:intro>

== Should You Apply? <chap:should>

//#chapter-opener([Definitely, yes. CS PhD study in the US is often *fully funded* and admission into good universities in the US is *not* any harder than in other countries.])

#simpsons[
  Don't make fun of graduate students. They just made a terrible life choice.
]


Many students, especially those from less well-known universities and smaller countries, often wonder if they should apply to a CS PhD program in the US. Common concerns include (i) the *difficulty of getting admitted* and (ii) the *cost of graduate study* in the US.

Much of these uncertainties stem from the lack of information and guidance on the admission process in the US. Social platforms like Facebook and Reddit are full of confusion and contradictory information.
This book aims to address these concerns.

#figure(
  image("files/imposter.jpeg", width: 50%),
  caption: [Stress caused by imposter syndrome is real. Don't let it stop you from applying to CS PhD programs in the US!]
) <fig:imposter>

#paragraph[Not any harder than other countries][While admission to a good CS PhD program in the US is very competitive, it _should not_ be any harder than admission to good CS PhD programs in other countries. It might even be more flexible since CS PhD in the US _do not_ require having an MS or a research topic, proposal, or advisor in advance (@sec:non-us-differences compares CS PhD study in the US to other countries). It doesn't even require having a CS background (@sec:non-stem).

If you believe you have a chance in other countries, e.g., Australia, Canada, Japan, Germany, UK, South Korea, and Singapore, then you will surely have a chance in the US as well.]

#tip-block[The most selective US schools, e.g., top 10 in CS (@chap:rankings), are extremely competitive for everyone, regardless of background. Don't be discouraged if you don't get into a "household name" university as there are many excellent CS programs (@sec:selecting-ranking-schools) in the US that are not as well-known internationally but still offer great research opportunities and training. In fact, many top CS researchers and faculty members in the US did not graduate from #gls("Ivy League", capitalize:true, first:false) or top 10 schools.

Many students, especially those from smaller countries or schools, have the *imposter syndrome*---worrying they're _"not good enough"_, or get discouraged when competing with others with "stronger" profiles (@sec:profile-not-strong). As explained in @chap:evalapps, #gls("adcom") looks for potential and evidence you'll thrive in research environment and fit well at their institution---things that usually have nothing to do with your GPA or GRE scores.
]

#note-block[As an international student you are not an outsider---you are the _norm_. In the most recent #link("https://datavisualization.cra.org/TaulbeeSurvey/CRA_Taulbee_Survey_Report_2024.html")[CRA Taulbee Survey], about *66% of CS PhD recipients in the US were international students* (non-resident aliens). So if you worry that being from a smaller or less well-known country puts you at a disadvantage, remember that roughly _two out of three_ CS PhDs in the US are international, just like you.]

#figure(
  statbar((
    ([International], 66, rgb("#4472C4")),
    ([Domestic], 34, rgb("#A6A6A6")),
  )),
  caption: [CS PhD recipients in the US by residency (#link("https://datavisualization.cra.org/TaulbeeSurvey/CRA_Taulbee_Survey_Report_2024.html")[CRA Taulbee Survey 2024]). About two-thirds are international students.],
) <fig:intl-share>

#paragraph[Funding Is (Generally) Not An Issue][In most cases CS PhD students _do not_ need to worry about funding, especially at good #gls("R1") universities in the US. 
If you are admitted, you will almost certainly receive _full funding_ (@chap:funding) to support your study. 

Your funding includes tuition, health insurance, and #gls("stipend") (in STEM field in CS you get paid for your study!).
Moreover, you often receive additional benefits such as summer pay (@sec:summer-funding), laptops (@sec:buying-equipment), and traveling to conferences and workshops. 

Full funding for CS PhD students is the norm in the US, and I'd go as far as to say that if you are not admitted with full funding, you might want to not accept the offer. The reason is that CS is in high demand and you're actively contributing to improving the reputation of the university and more generally advancing CS.

#caution-block[While full funding is standard for CS PhD, always double-check the details of your offer (@sec:offer-letters) before accepting, especially for programs outside STEM or at smaller/private universities.]
]
// % \paragraph{Discrimination is not tolerated} Not only is discrimination illegal, diversity and inclusion are highly valued in US universities. Many universities take great pride in their diverse student body and faculty.

// % In fact, many resources are available to encourage and support students from minority and diverse groups to pursue higher education and research, e.g., specific scholarships and fellowships. Faculty in CS are also familiar with and are encouraged to support such students in their group. There are also incentives, such as dedicated funding and awards, to motivate faculty to recruit and mentor minority students (\autoref{sec:urm}).

=== Is a PhD Worth It? Alternatives and Opportunity Cost <sec:worth-it>

//#draftbanner(note: "Be honest here---I don't want to come across as recruiting everyone into a PhD. Maybe add a short anecdote about a student who chose industry and was happy.")

So far I have tried to convince you that getting into a CS PhD program in the US is not as hard or as expensive as you might think. But _should_ you do a PhD at all? The honest answer is: _not everyone should_.

#definition-box[A CS PhD is a #highlight[5--6 year commitment] (@sec:time) that mainly trains you to do _research_. If your goal is to become a professor, an industry research scientist, or to work on hard open-ended problems in a national lab or research-heavy team, then a PhD is essentially required and well worth it. If your goal is to be a strong software engineer at a tech company, a PhD is _not_ required and, in many cases, not the most efficient path (learning _vibe coding_ with LLMs is probably a better way to go).]


#caution-block[It is also worth knowing that a PhD is _hard_, and not everyone finishes. The #link("https://cgsnet.org/project/minority-attrition-and-completion-in-stem-doctoral-programs")[10-year completion rate hovers around 55--65% in STEM fields]. I mention this not to discourage you, but to be honest about the challenges. Persistence matters, and research on #link("https://www.phdcompletion.org/promising-practices/mentoring-and-advising/")[doctoral completion] also emphasizes the importance of a close and effective relationship with your advisor and mentors (@chap:choosing-advisor).]

#figure(
  statbar((
    ([Engineering], 64, rgb("#4472C4")),
    ([Life sciences], 63, rgb("#4472C4")),
    ([Social sciences], 56, rgb("#4472C4")),
    ([Math \& phys. sci.], 55, rgb("#4472C4")),
    ([Humanities], 49, rgb("#4472C4")),
  )),
  caption: [10-year PhD completion rates by broad field in the US---note that even in the best-completing fields, a substantial fraction do not finish (#link("https://cgsnet.org/project/minority-attrition-and-completion-in-stem-doctoral-programs")[CGS PhD Completion Project]).],
) <fig:completion-rates>

#paragraph[The real cost is opportunity cost][The tuition and stipend are covered (@chap:funding), so the financial cost to you is roughly zero---in fact you get paid. The real cost is _opportunity cost_: the difference between a PhD stipend (@sec:ra-cost) and what you could earn as a software engineer over those same 5--6 years, which can easily add up to several hundred thousand dollars. People who are happy they did a PhD almost always say it was because they wanted the _work_ (research), not because of the salary afterward.]

#paragraph[Alternatives to consider][
- *Industry directly.* If you mainly want to build things and earn well, a strong undergrad or MS plus a good portfolio (@sec:personal-website) is often enough.
- *A terminal MS (@chap:ms), then industry.* A good way to deepen your skills and credentials without committing to research.
- *Research engineer / pre-doctoral roles.* Many industry labs hire research engineers or offer 1--2 year pre-doc programs (@chap:research-opportunities). These let you _try_ research before committing to a full PhD.
- *A PhD in another country.* Often shorter (@sec:non-us-differences) if the longer US model does not appeal to you.
]

#note-block[This #link("https://matt.might.net/articles/phd-school-in-pictures/")[series of pictures] from #link("https://matt.might.net")[Matt Might] illustrates what a PhD means.]


None of this is meant to scare you. The point is simply that a PhD is a particular kind of training for a particular kind of career, and it is worth being honest with yourself about whether that is what you want _before_ you spend a year on applications.


#tip-block[*A useful test*: would you still want to do a PhD if it did _not_ lead to a higher salary or a fancier job title---purely because you enjoy digging into a hard problem for years? Would you still want to spend 5--7 years on a PhD if it does not improve your immigration status or make you more employable?

If yes, you are the kind of person who tends to thrive. If the PhD is mainly a means to a job that does not actually require it, pause and reconsider]



== What's a PhD in CS? <sec:phd-in-cs>
//\sectioninfo{A PhD in CS is a \textbf{research} degree that transforms you into a researcher in a specific area of CS.
// You will become an expert in a particular topic and know more about it than anyone else in the world (in many cases even your advisor).}

#definition-box[
A PhD in CS is a #highlight[research degree] in Computer Science. Unlike undergraduate or even Master's programs (@chap:ms), which focus on breadth of knowledge through coursework, it is about _depth_ and pushing the boundary of a specific area within a CS field, such as software verification within the field of Programming Languages or Formal Methods (@sec:fields-and-areas). You will become an expert in your area of research and contribute something new to the field that has never been done before.
]

Job-wise, a CS PhD is the standard credential for positions where doing research _is_ the job. In academia, it is a hard requirement for tenure-track professorships (@sec:faculty-types) and most postdoc and research faculty roles. In industry, it is expected (and often required) for titles like _research scientist_ or _applied scientist_ at places such as Google DeepMind, Microsoft Research, and Meta AI, and it is highly valued for researcher and senior R&D roles. It also qualifies you for research staff positions at national labs (e.g., Sandia, Oak Ridge) and government agencies, (e.g., NSF, DOE, Defense Research) and for founding or early technical roles at deep-tech startups. Note that for _ordinary software engineering_ jobs, however, a PhD is rarely required (though Google and Amazon often hire PhDs as software engineers)---the degree pays off specifically when the job involves open-ended problems no one yet knows how to solve.



#note-block[In CS, _most_ PhD graduates go to industry, not academia. In the #link("https://cra.org/crn/2025/06/cra-update-new-cra-taulbee-survey-findings-show-record-doctoral-production-rising-enrollment-and-shifting-undergraduate-trends/")[2024 CRA Taulbee Survey], about *54% of new CS PhDs took industry positions* in North America versus about *39% who took academic jobs* (the rest went to government, other sectors, or were still searching). These numbers swing year to year---industry was 57.5% the year before---so don't read too much into the exact figures, but the broad picture is steady: a CS PhD is valued highly in _both_ industry and academia (@sec:worth-it).]

#figure(
  statbar((
    ([Industry], 54, rgb("#4472C4")),
    ([Academia], 39, rgb("#2E8B7F")),
    ([Other / searching], 7, rgb("#A6A6A6")),
  )),
  caption: [Where new CS PhDs went in North America (2023--24). Most go to industry, but academia remains strong (#link("https://cra.org/crn/2025/06/cra-update-new-cra-taulbee-survey-findings-show-record-doctoral-production-rising-enrollment-and-shifting-undergraduate-trends/")[CRA Taulbee Survey 2024]).],
) <fig:phd-destinations>

#note-block[A PhD in CS is not just a degree, it is a *journey* that transforms you into a researcher. You will learn how to think critically, solve problems, deal with adversity, and work independently. You will also learn how to write and "sell" your work, collaborate with others, and effectively communicate your ideas. In the end, you will have a deep understanding of your chosen field and become an expert in your area of research. In fact, you will know about your research topic more than *anyone* else in the world, including, in many cases, your advisor! This is a scary thought, but it is also exciting and rewarding.]


=== CS Fields and Areas <sec:fields-and-areas>

CS is a broad academic discipline with many specialized areas of research. Understanding the structure of CS can help you communicate your research interests and goals more effectively, e.g., in your #gls("SOP") (@chap:sop), and also assist you in finding suitable advisors and research topics (@sec:finding-advisor).

#paragraph[Disciplines][At the highest level, academic _disciplines_ are broad domains of scholarly study, such as CS, Mathematics, Physics, Biology, Economics, Law, Social Sciences, and the Humanities. Universities typically have entire departments and degree programs centered on these disciplines (e.g., a Dept. of Computer Science or of Economics).]

#figure(
  image("files/xkcd_purity.png", width: 75%),
  caption: [Disciplines "arranged by purity." CS sits close to math on this spectrum. Source: #link("https://xkcd.com/435/")[xkcd 435], #link("https://creativecommons.org/licenses/by-nc/2.5/")[CC BY-NC 2.5].],
) <fig:purity>

#gls("STEM") collectively refers to Science, Technology, Engineering, and Mathematics. In this book, the important point is not the acronym itself but that funding, publication culture, and admissions practices can differ substantially even among STEM fields.

#paragraph[Fields][Within a discipline such as CS, we have #gls("fields")---major branches that often correspond to faculty groups, conference communities, and sometimes even degree tracks. Common fields in CS include:

- Artificial Intelligence (AI),
- Machine Learning (ML),
- Software Engineering (SE),
- Programming Languages (PL),
- Formal Methods (FM),
- Theory of Computation (TCS),
- Operating Systems (OS),
- Security and Privacy,
- Computer Vision (CV),
- Natural Language Processing (NLP),
- Human-Computer Interaction (HCI),
- Computer Architecture,
- Databases,
- Networking,
- Graphics and Visualization,
- Computational Biology

Most faculty have a _home_ field with which they are primarily associated, but may also publish in related fields. For example, many SE researchers also work in Programming Languages and Formal Methods; Security researchers may also work in Systems and Theory.
]

#paragraph[Areas][Within a field, we have _areas_---narrower subfields where people specialize. For example, PL includes Type Systems, Formal Verification, Program Synthesis; SE includes Testing, Program Repair, Empirical SE, and AI4SE (a new and fast-growing area); and
ML includes Supervised/Unsupervised Learning, Reinforcement Learning, and ML Theory, and
AI traditionally includes Planning, Reasoning, and Robotics (though many of these are now distinct fields).
Some areas are growing so large that they are becoming fields in their own right. ML, for instance, originated within AI but is now widely regarded as a standalone field.]

#paragraph[Topics and Projects][Finally, we have _research topics_, which refer to concrete problems or techniques within an area. For instance,
 Model Checking or Theorem Proving in Formal Verification, and Mutation Testing, Test Prioritization, or Symbolic Execution in Software Testing.


At the finest granularity, a research _project_ or dissertation focuses on a specific question within a topic (or cross-topics and even cross-areas). For example: _"How can symbolic execution be applied to generate high-coverage test cases for deep neural networks?"_
]

#example-box[
For example, my own #link("https://roars.dev")[research profile] can be structured as:
- *Discipline:* Computer Science
- *Fields:* Software Engineering and Formal Methods
- *Areas:* Software Verification, Testing, and Analysis
- *Topics:* Theorem Proving, Symbolic Execution, Test Generation
- *Projects:* Applying automated theorem proving to verify the correctness of deep neural networks, and using dynamic analysis to synthesize program invariants
]



=== How Long to Complete the CS PhD Program? <sec:time>
// \sectioninfo{About 5--7 years in the US.}

Typically it takes 5--7 years for a CS PhD in the US. This is usually longer compared to other countries (@sec:non-us-differences), which might require having an MS (@sec:phd-vs-ms).

#note-block[The #link("https://ncses.nsf.gov/surveys/earned-doctorates/2024")[NSF Survey of Earned Doctorates] found a #link("https://cra.org/crn/2014/04/time_to_degree_in_computing/")[median time-to-degree in computing of about *7.6 years* from the start of graduate school]. In other words, plan for this to be a _long_ commitment (@sec:worth-it)---closer to the upper end of the 5--7 year range than the lower end, especially if you include time spent on internships and a master's along the way.]

#figure(
  image("files/c4a.png", width: 60%),
  caption: [The "ambition" level of a PhD student over their years of study (they miss the 6--7th year when the ambition is _"Just let me graduate"_).],
)

The first two years are typically spent taking coursework (somewhat equivalent to MS study), finding an advisor, passing a #gls("qualifying-exam", first:true), and learning how to do research. The next 2--3 years focus on research, forming a #gls("dissertation", first:true) topic, advancing to #gls("candidacy") (often by defending a #gls("proposal", first:true)), and getting results published. The last 1--2 years are usually spent continuing to publish, writing and defending the dissertation (the #gls("defense", first:true)), and looking for a job.

#figure(
  image("files/xkcd_thesis_defense.png", width: 42%),
  caption: [The light at the end of the tunnel: the #gls("defense"), where you present and defend your #gls("dissertation"). Source: #link("https://xkcd.com/1403/")[xkcd 1403], #link("https://creativecommons.org/licenses/by-nc/2.5/")[CC BY-NC 2.5].],
) <fig:thesis-defense>

Within these 5--7 years, CS PhD students sometimes take a "leave of absence" for 1--2 semesters or for a summer to do internships at companies and research labs.

#example-box[
  I started my PhD with an MS, and it took me 7 years (Fall '07--Fall '14). I spent 9 months doing an internship at the #link("https://www.nrl.navy.mil")[Naval Research Lab]. My PhD did take a bit longer than usual, but it allowed me to explore new research areas and topics (and I had quite a bit of fun, including meeting my future wife).
]



=== Undergrad Not in CS or Related Disciplines <sec:non-stem>
// \sectioninfo{You can successfully apply to CS PhD even if you have non-CS background.}

Even if your undergraduate #gls("major") is not in CS or a related discipline, you still can apply to a PhD in CS _as long as_ you can demonstrate that you are ready for it through your background, research experience, LORs, statements, etc. You might even be able to leverage this to make your profile stand out, as mentioned in @sec:stand-out.

A main concern that #gls("adcom") has for a non-CS or non-STEM student is whether they have sufficient technical background from core CS courses. So you need to demonstrate that you have this knowledge through your coursework, projects, or research.

For example, if you have taken a class on algorithms, even an online course from Coursera, you can talk about it in your #gls("SOP"). If you have done a project that requires knowledge of operating systems or have a professional certification (e.g., A+) through work, you can talk about it. If you have done research that requires knowledge of discrete math, you can talk about it. You can also ask your #gls("LOR") writers to discuss your technical background.

#paragraph[Core CS topics][Common CS knowledge that you should know includes:

- *Programming foundation:* programming concepts in modern languages such as C++ or Java.
- *Discrete math:* logic, set theory, proof techniques. 
- *Data structures and algorithms:* linked lists, trees, sorting, searching.
- *Computer OS or systems:* memory management, file systems, processes.
]

In summary, you _do not need_ to have CS or STEM degree or even have taken formal CS courses to apply for a CS PhD. You just need to show that you have this essential knowledge, for example through the ways mentioned above. Many universities are well aware that incoming graduate students might not have all the technical background, so they often have _“bridge”_ courses to help students catch up. For example, GMU has four bridge courses corresponding to the four core areas above that incoming students can take to catch up on their CS knowledge.

#example-box[
  I would advocate for a non-STEM student who shows they have a strong drive for CS by studying core CS knowledge through various channels (e.g., self-study through online courses and participating in open-source projects). 
  
  I have seen many students with non-CS backgrounds who are very successful in CS PhD. I also have  seen many students with CS backgrounds who are not successful in a CS PhD. So it is not about your background; it is about your drive and passion for CS research.
]



=== Is MS Required for CS PhD Admission? <sec:msrequirement>
// \sectioninfo{You do not need an MS to do PhD in CS.}

No, while other countries often encourage or even require an MS for PhD students in CS (@sec:non-us-differences), it is common in the US to directly apply for a PhD program after a 4-year undergraduate program (e.g., after getting a BS degree). In addition, most CS PhD programs are designed so that students can get an MS degree "along the way" to the PhD, for example after finishing the 2-year coursework. This is one of the reasons why a CS PhD in the US takes longer (5--7 years as mentioned in @sec:time) than in other countries.

However, an MS _can help_ admission if it gives research experience or is from a more well-known school than your undergraduate institution (@chap:your-school).
Some professors prefer students with an MS since they have more experience and are more mature. But this is not a requirement, and many professors are happy to take students without an MS.
Moreover, if you have an MS, then some coursework _might_ be transferred for course credit, which _might_ save some time. But in general, don't count on finishing earlier just because you have an MS.

#example-box[
  I started my PhD with an MS in CS from a US university. The MS helped me gain research experience, but I still had to retake courses because I did my MS at a different university. So in the end, I did not save any time because of the MS.

  In general, don't worry if you don't have an MS. But also don't feel that you wasted your time if you have an MS, as it can help you in research.
]


=== Can I Apply for PhD in CS for the Spring or Summer? <sec:apply-spring-summer>
Most students apply to start their PhD in the Fall. This means they submit their application around December, receive admission decisions (@chap:accepted) sometime in the Spring, and officially begin their PhD in the Fall (usually late August).

Fall---the start of the #gls("AY")---is the most common time to begin PhD programs in the US, and many universities _only_ accept new PhD students in the Fall. Importantly, applying for the Fall gives you access to funding opportunities (@chap:funding) that are available only for Fall admits, such as TAships (@sec:ta) and some fellowships.

However, many universities also accept PhD students in the Spring or Summer, especially when you have a specific advisor who can fund you through an RAship (@sec:ra). This is less common, and you may lose funding opportunities that are available only for Fall admits.

#example-box[
  GMU allows PhD students to start in the Spring, but it is usually not recommended. Two of my PhD students started in the Spring because I had funding to support them right away. In general, a student can start in the Spring or even Summer only if an advisor already has RA funding for them. Students who do not start in the Fall may also lose benefits reserved for Fall admits, such as a first-summer stipend. So, it is possible, but I do not recommend aiming for it.
]


=== PhD in the US vs. Other Countries <sec:non-us-differences>
// \sectioninfo{Among several differences, CS PhD in the US does not require an MS degree but has a longer PhD study time.}



#figure(caption: [Comparison of the CS PhD program in the US and other countries],
text(size: 0.9em,
    table(
      columns: 3, align: left, stroke: none,
      table.header(
        [*Aspect*], [*US PhD Programs*], [*Other Countries*],
      ),
      table.hline(),

      [Duration], [5--7 years], [3--5 years],
      [MS Required], [Not required], [Often required],
      [Coursework Required], [Yes (first 2 years)], [No],
      [Research Proposal Required], [No], [Yes (in some countries)],
      [Academic (Faculty) Job], [Direct], [Postdoc],
      [Work-Life Balance], [Less], [More],
    ))
)<tab:us-vs-other>

@tab:us-vs-other summarizes the main differences between CS PhD in the US and other countries. Note that these differences can vary by institution and country. Some countries might have a PhD program that is similar to the US. The following are some common differences:


- *MS requirement and PhD duration*: CS PhD programs in the US do not require an MS degree (@sec:time, @sec:msrequirement). In contrast, many other countries require having an MS degree before joining a PhD program. This means that US PhD programs are longer (5--7 years, 2 of which are coursework) than other countries (3--4 years, no coursework).

- *Project proposal*: In many countries, you have to choose a project and advisor _during_ the application process (e.g., you write a proposal to a potential advisor). But this allows you to start your research right from the beginning. In the US, you often start your PhD without an advisor or project and find them later. Usually you have two initial years to take classes, explore and find an advisor and research topic.
    
- *Coursework*: In the US you will spend the first couple of years taking classes and exploring potential advisor and research topics. After that, you have to pass a series of exams during your PhD---qualifying exam, comprehensive exam, thesis proposal defense (#gls("ABD")). In other countries, you often start your research right away and work on the research project you proposed with the advisor you chose. Moreover, you might not have exams like those in the US or only have to do a few of them.
    
- *Funding*: In many countries, funding often comes from the university or the government. This funding often has a fixed duration, e.g., 3 or 4 years. In the US (@chap:funding), funding such as GRA comes directly from your advisor (no fixed duration). There are also fewer GTA opportunities in European universities compared to the US.
    
- *Academic Position after PhD*: In other countries, PhD graduates interested in academia typically go for additional research appointments, i.e., a #gls("postdoc", first:true) in the US, and then consider faculty positions. In the US, PhD graduates often apply directly for faculty positions. Postdoc for US graduates is no longer a popular option as it was before. The reason is that US PhD programs are longer, so you already have enough research experience (e.g., publications) to apply for faculty positions. In contrast, in other countries, PhD students often finish their PhD earlier and need more time to gain research experience before applying for faculty positions.
    
- *Work-life Balance*: PhD students in the US are often said to be overworked compared to other countries, e.g., in Europe. This is partly due to the longer PhD program and that US PhD students are often paid through GTA, which requires them to do GTA in addition to their own research. In contrast, PhD students in other countries are often paid through fellowships, which might not require doing GTA.
    #caution-block[
      Work-life balance is more of a personal and cultural issue (@chap:cultural) than a regulatory one. US academia is known for its intense work culture, because students themselves are fiercely competitive (after reading this book you would see how competitive it is to get into a good PhD program in the US), and opportunities for research and funding are abundant. All of these contribute to a systems that favors those who work hard and produce results, which can create a culture of long hours and high stress.
    ]



// % \section{Timeline}

// % \begin{table}[h!]
// % \centering
// % \begin{tabular}{l|l}
// %     \toprule
// % \textbf{Month} & \textbf{Task} \\
// % \midrule
// % January-March & Research programs and prepare for tests \\
// % April-June & Take standardized tests (GRE, TOEFL, etc.) \\
// % July-September & Prepare application materials (SOP, LORs, etc.) \\
// % October-December & Submit applications \\
// % January-March & Interviews and follow-ups \\
// % April & Admission decisions \\
// % \bottomrule
// % \end{tabular}
// % \caption{Application Timeline}
// % \end{table}
// % \section{Why the US and not other countries?}
// %

=== Waiving Application Fee <sec:fee-waive>

Most PhD programs do not waive the application fee, which is typically set by the university and not the department. Individual departments and programs usually do not have the authority to waive the application fee, even if they want to.

However, some universities _do_ waive the fee, e.g., Rice and TTIC do not charge a fee for PhD applications, and many universities waive fees for domestic students (@chap:domestic-students).
Some programs also waive the fee if applicants attend their open house or information sessions. Others may waive the fee if the applicant provides proof of _financial hardship_, such as a statement from a financial advisor or a bank statement.



#note-block[
  Requiring an application fee helps ensure that applicants are serious, as it discourages non-serious candidates. Most CS programs already receive _far too many applications_ and would be overwhelmed if the process were free---_"hey, it's free, so I can just apply to as many schools as I want to increase my chances."_ Even with an application fee, competition is already very tough; imagine if the application were free and the number of applications tripled or quadrupled.

  If you have financial difficulties, you can ask the department for a waiver, but this is typically only granted in exceptional cases.
]


== How Is Your Application Evaluated? <chap:evalapps>

//#chapter-opener([Applications are evaluated by the PhD Admission (#gls("adcom")) committee and each application is typically reviewed by three #gls("adcom members", display: [faculty members]).])

After you submit your PhD application (@part:application), it will be checked for general requirements---whether you submit your transcripts and standard scores? Usually, this screening process is done through a central university system, i.e., not by CS faculty.

After screening, your application is complete and forwarded to the CS department for further evaluation. If you don't pass screening,  the system will tell you what is missing and what you need to do. So pay attention to your email and check your application status regularly.


#caution-block[*Hakan*: At GMU, for full consideration, students should make sure to submit _ALL_ required documents by the application deadline, and should never assume that some required documents (such as official TOEFL scores or official diplomas/transcripts) will be waived by the admissions office. If something is listed and not marked as optional, it is mandatory and they should plan for submitting all those.]

=== Admission Committee <sec:adcom>
// \sectioninfo{Adcom members are faculty who evaluate your application. They consider various factors, e.g., research experience, LORs, SOP}

The PhD #gls("adcom", first:true) is a committee of CS faculty who review applications and recommend admission decisions. Each application is typically evaluated by about three members with relevant expertise (e.g., AI, Systems, Theory, SE, or HCI).

The size and workload of the adcom depend on the department. At GMU, the PhD adcom has about 15--20 faculty, each reviewing \~30 applications. Large schools often have separate adcoms for MS programs (@chap:ms).

PhD adcoms typically include assistant professors (@sec:faculty-types), partly because junior faculty need students to build their labs, produce research, and make progress toward tenure. That does not make their reviews dishonest; it means admissions is inseparable from faculty needs. The #gls("adcom chair",first:false) is usually a senior faculty member who assigns applications based on research interests or faculty mentioned by applicants (e.g., I review SE applicants).

Each application is assigned to about three #gls("adcom members",first: false), who independently evaluate your profile and then reach a consensus. They consider factors such as #glspl("LOR"), #gls("SOP"), research experience, GPA, test scores, and interviews. (see @part:application).

#example-box[
  At GMU, we usually admit full-time PhD candidates with funding (@chap:funding) or reject them. In rare cases, we admit without funding if the student has external support (e.g., government or fellowship). We justify our decision (@sec:ievaluate) with a summary of your application, listing strengths (e.g., well-known school) and weaknesses (e.g., generic LORs).
]


=== How Applications Are Assigned to Adcom Members? <sec:applications-assigned>
// \sectioninfo{Adcom members only review applications assigned to them (typically matching their expertise) and rarely get involved in other applications}


#gls("adcom members",capitalize:true) typically can view any submitted applications. However, we only review those that are assigned to us, which are already too many. #gls("adcom chair", capitalize:true) will assign applications to reviewers based on their expertise, e.g., if a student says they want to do SE or interested in working with me, and reviewers will only evaluate those applications. Occasionally we might look at other applications, e.g., if the student contacted me, I know that student, or they are from a school in Vietnam I am familiar with. However, even if we look at them, we usually do not get involved in their evaluation directly.

Note that the assigned reviewers are the main ones deciding your application, but at many schools other faculty in the department can also have access to your application and provide inputs and opinions on your profile. Thus, it helps to contact faculty (@sec:contact) and mention faculty you're interested in your SOP (@chap:sop).

=== How Are Decisions Really Made? <sec:how-decisions>
// \sectioninfo{Even if all adcom reviewers recommend acceptance, the application can still be rejected. Vice versa, if all reviewers think the application is weak, the student might still be admitted.}

After reviewers have evaluated an application, #gls("adcom chair") reviews their recommendations and asks them to resolve major disagreements. Typically, the assigned reviewers make the decision; the department chair and senior administrators do not rank individual applicants. In most cases, reviewers work independently and discuss an application only when their recommendations conflict (@sec:adcom-discuss).

#caution-block[*What faculty will not tell you:* PhD admission is not a merit ranking in which the strongest applicants automatically occupy the available seats. It is a matching process constrained by faculty attention, research needs, grant funding, TA budgets, and advising capacity. The tenth-strongest applicant on paper may be admitted while the fifth-strongest is rejected because someone is prepared to advise the former and nobody can responsibly take the latter.]


Even if all reviewers recommend acceptance, the application is not automatically accepted—especially if no faculty is willing to advise the student. For example, if the applicant is interested in a research area with no available faculty (e.g., AI/ML where faculty may already have many students), then the student will not be admitted (see more rejection reasons in @sec:why-rejected). This is increasingly common as the number of applicants grows faster than available faculty. Note that not every CS faculty can formally advise and graduate CS PhD students (@sec:faculty-types).

However, if a faculty member is interested in the student and makes this known to the adcom, the student is much more likely to be admitted—even if that faculty member expects the department to provide initial GTA funding. By advocating for a student, the professor is effectively saying, _"I am willing to spend years advising this person."_ That commitment carries more weight than another small difference in GPA. This is the real benefit of contacting faculty (@sec:contact).

If the student mentions a faculty member in their SOP, adcom may ask that faculty member to review the application. Even a student with a weaker conventional profile may be admitted if a professor provides a concrete reason to believe the student will succeed in their group. Adcom members are understandably reluctant to overrule the person accepting the advising responsibility.


=== Do Adcom Members Talk to Each Other? <sec:adcom-discuss>
// \sectioninfo{Sometimes adcom members discuss applicants, but in most cases they make independent decisions.}

We typically review applications independently and do not talk to each other.  This is to avoid biasing, e.g., if one reviewer says they want to accept, the other might feel pressured to accept as well.  

However, when there are discrepancies in evaluations, #gls("adcom chair") will ask reviewers to discuss the application to reach a consensus.  We might also talk to each other for interesting or strong applications, e.g., how to recruit this student or who should be the advisor. 
If the student mentioned a faculty member in their SOP, we might ask that faculty if they are interested in the student. 


Note that other disciplines might have different practices. For example, adcom might select a top list of applicants and then discuss them in a meeting to determine who to interview. @fig:adcom-discuss-physics shows an example of how a PhD admission committee in Physics evaluates applications. Note that this is not common in CS, where we typically do not have a grading rubric and do not discuss applications in a meeting.
In CS, both the reviews and interviews are often done independently (@sec:interviews).

#example[From a Professor in Physics at an R1 university][ 
  We have a pretty well fleshed out grading rubric for applications that has categories like grades, research, writing ability, etc. I would say our rubric is weighted about 1/2 on academics (research, LORs, grades) and 1/2 on the idea of "grit" or "resilience" (engagement, leadership, working through obstacles).
  
  The rubric helps a lot to standardize how committee members grade, and speeds things up a bit because you know what to look for. We spent what seemed like forever on the details of the grading system (e.g., what does a score of "3" vs a "2" in writing look like?) but now it's very helpful.

  We also do roughly three rounds of selection: a first "triage" round to determine the top ~100 applications, a second round to determine about 25 people to interview, and then a third round to decide the actual offers. That also helps to speed things up a bit, since in the first round with all the applications you can move fairly quickly since you just need to sort into "good" and "bad". By the time we're getting into the details and reading everything more closely in rounds 2 and 3 most of the applications have been removed from consideration. So for this method I do maybe 5 minutes per app in round 1, but closer to 20 minutes per app in round 2, and usually round 3 is long discussions about specific people.] <fig:adcom-discuss-physics>
  


=== How I Actually Review a PhD Application <sec:ievaluate>

This is how _I_ review applications at GMU and previously at UNL. We do not have any universal rubric or use any formal scoring system. 

#paragraph[Assignments][I am usually assigned about 30 applications and given roughly two weeks. I reserve one or two days and spend about 10--15 minutes per application: less on an obvious rejection, much more on someone I may advocate for. That sounds brutally short, but that is usually sufficient to make a decision, e.g., Philip Guo reports spending only #link("https://pg.ucsd.edu/PhD-application-tips.htm")[3--5 minutes] per application.] 

#paragraph[Stage 1: General Info][Our system gives me one PDF containing the application summary, transcripts, test scores, #glspl("LOR"), CV, #gls("SOP"), and writing samples. I first check the summary for English score below the university minimum, missing credentials, or grades (GPA) that may violate graduate-school requirements (@chap:standard-tests). Usually GMU also does this screening automatically, but I double-check. If the application fails this stage, I flag it but still read the rest of the file to see if there is a reason to advocate for the student.]

#paragraph[Stage 2: Research Experience][I skim the transcript for repeated low grades in relevant Math or CS courses, then move quickly to the evidence that matters more. I look through the CV for research experience, publications, serious projects, and unusual achievements. 

I read strong, specific LORs carefully and skim generic ones. _"The student earned an A in my class"_ tells me almost nothing. A letter describing the problem you attacked, where you struggled, what you contributed, and how you compare with previous researchers get my attention more (@chap:LOR).]

#paragraph[Stage 3: Your story][I read the SOP to see whether it connects your past work to a plausible research direction and to faculty who can advise you here (@chap:sop). I do not need childhood inspiration or your interests in changing the field or the world with AI. I want concrete evidence, technical maturity, and a reason this application belongs at this department rather than twenty others. I read strong SOPs much more carefully than weak ones, which I often skim.
]

#paragraph[Stage 4: Standing Out][The key to a successful application is standing out from the crowd (@sec:stand-out). You need to be standing out somehow, e.g., unusually strong research, a trusted and revealing letter, a striking technical achievement, clear resilience, or an excellent match with a faculty member (in which case I might pass the file to that faculty member for a second opinion). If I cannot find such a reason, the application is likely to be rejected even if nothing is obviously wrong.]

#example-box[Suppose I open a file from an applicant at a university I do not know. The GPA is 3.6: fine, it passes the university minimum, but doesn't mean much to me (note that even 3.9 or 4.0 also does not mean much, unless it's from a very selective school that I recognize then I will make a note about it).  The transcript has solid CS and Math grades: _no red flag_. The CV lists several IEEE papers that I don't recognized: _Noted, hope they will be mentioned in the SOP or LOR_. One letter says only that the student excel in a class: _generic, don't care_. A second letter describes how the student found a flaw in the original experiment, rebuilt the evaluation, and drove the resulting paper: _now I am paying attention_. The SOP explains that work clearly, result in publications, and connects it to two active faculty in our department: _now I have a case to make_.
]

#paragraph[Stage 5: Entering Recommendations][At GMU, my recommendation is usually either rejection or admission with full funding, commonly a GTA (@chap:funding). I may nominate an exceptional applicant for a Presidential Fellowship. Although the system offers options such as provisional or unfunded admission, I rarely use them: in my view, we should either support a full-time PhD student or not admit them.]

#paragraph[Interviews are often recruiting, not screening][I do _not_ need an interview to recommend admission. If I ask to chat, it is often because I am considering advising or recruiting the student, not because every applicant must pass another formal round (@sec:interviews). Other disciplines and some CS departments use interviews differently (@sec:adcom-discuss).]


=== Direct Admit vs Committee Admit <sec:direct-vs-committee>

Discussions on Reddit and Discord on graduate admissions often mention _"direct admit"_---the student is "directly admitted" by an individual faculty vs _"committee admit"_---the student is admitted by the adcom committee.  Answers to these questions---often from applicants who are not familiar with the admission process---make it sound more mysterious than it actually is.

#definition-box[Direct Admit vs. Committee Admit][A _direct admit_ is a student admitted largely because an individual faculty member wants to advise (and often fund) them; a _committee admit_ is admitted through the regular adcom review. In reality, _all_ applications go through the committee---a "direct admit" simply has a faculty advocate, which makes the committee much less likely to contest the decision.]

The short answer is that _all_ applications go through the adcom committee. However, admission decision is _heavily influenced_ by whether an individual faculty member is interested in the student and willing to advise them, but this is still part of the committee review process. So even if a student is "directly admitted" by a faculty member, their application still likely goes through normal committee review process (though it will be _much less likely_ be contested as someone is already taking responsibility for the student), and the final decision is made by the committee based on the evaluations of all reviewers ("committee admit").



Thus, it comes down to who can advocate for you in the review process. This is the reason why contacting faculty (@sec:contact) and mentioning faculty in your SOP (@chap:sop) can be very helpful, as it can lead to a faculty member supporting your application. However, even if a faculty member is interested in you, the final decision is still made by the committee.



== Application Timeline and Checklist <chap:timeline>

// #draftbanner(note: "Double-check the months against the current cycle---deadlines have crept earlier over the years. Consider replacing the text table with a nicer figure/timeline graphic later.")

The CS PhD application process spans almost a full year, from the time you start researching programs to the time you make a final decision (@sec:accept-postpone-decline). Below is a rough month-by-month timeline for a _Fall admission_ (the most common; @sec:apply-spring-summer explains why Spring/Summer admission is rare). The exact dates shift from year to year and school to school, so treat this as a rough guide.

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    inset: 6pt,
    stroke: 0.5pt + gray,
    table.header([*When*], [*What to do*]),
    [*Jan--Apr* (year before)], [Decide whether a PhD is right for you (@sec:worth-it). Start getting research experience, especially for the summer (@chap:research-experience, @chap:research-opportunities). Identify fields and areas you like (@sec:fields-and-areas).],
    [*May--Jul*], [Build a long list of schools and potential advisors (@chap:choosing-school, @sec:finding-advisor). Take the English test if needed (@sec:english-tests)---it is valid for 2 years. Start a first draft of your SOP (@chap:sop).],
    [*Aug--Sep*], [Narrow your school list (#gls("reach-safety", first:true); a mix of reach / match / safety). Ask for letters of recommendation _early_ (@sec:asking-LOR). Email professors you are interested in, if appropriate (@sec:contact). Update your CV (@sec:cv) and personal website (@sec:personal-website).],
    [*Oct--Nov*], [Tailor your SOP per school (@chap:sop). Give your letter writers everything they need (@sec:help-your-LOR-writers). Fill out the online application portals. Request fee waivers where eligible (@sec:fee-waive).],
    [*Dec*], [Submit! Most deadlines fall between *Dec 1 and Dec 15* (some as early as Nov, a few in Jan). Send polite reminders to letter writers a week before each deadline (@sec:remind-writers).],
    [*Jan--March*], [Interviews happen for some programs (@sec:interviews). Time varies by school, but most are in this period.
    Be patient during the waiting game (@sec:late-rejection).],
    [*Feb--April*], [Admission decisions roll out. Attend open houses / visit days (@sec:visit-days). Talk to potential advisors and their students.],
    [*By Apr 15*], [Compare offers (@sec:visit-days), negotiate if you have multiple (@sec:negotiate), and accept/decline (@sec:accept-postpone-decline). #gls("April 15") is the deadline most US schools honor.],
  ),
  caption: [A rough month-by-month timeline for Fall CS PhD admission.],
) <tab:timeline>

#paragraph[A condensed checklist][Before you submit, make sure you have:
- A *SOP* tailored to each school, naming 2--3 potential advisors (@chap:sop).
- *3 strong letters* from people who know your research ability (@chap:LOR), with writers reminded before each deadline.
- An up-to-date *CV* (@sec:cv) and, ideally, a *personal website* (@sec:personal-website).
- *English test scores* sent if required (@sec:english-tests); GRE _only_ if it helps (@sec:gre).
- A *school list* that mixes ambitious reaches with realistic matches and safeties (@sec:selecting-ranking-schools).
- *Fee waivers* requested wherever you qualify (@sec:fee-waive).
]

#tip-block[A common mistake is starting the application process too late. As you can see, there are many things to do, and some of them do not depend on you, e.g., waiting for LORs. So _start early_ and give yourself enough time to prepare a strong application and to reduce stress.]

#pagebreak()
= Application Materials <part:application>

// %\partinfo{.}

#simpsons[Son, if you really want something in this life, you have to work for it. Now quiet! They're about to announce the lottery numbers.]


The goal of #gls("adcom") is not to reward the applicant who collected the most credentials. It is to find students with credible research potential whom the department can actually advise and support. The emphasis is #highlight[_matching_], which varies from school to school, faculty to faculty, and even from year to year. @sec:ievaluate shows exactly how I turn these materials into an admission recommendation.

The committee considers many factors, but the most important are #gls("LOR", first:true), #gls("SOP", first:true), and research experience, including publications and serious projects.

 
== Letters of Recommendation (LOR) <chap:LOR>
//#chapter-opener([LORs are very important, but only if they are *personalized* and *research focused*.])

#simpsons[To whom it may concern… D'oh!]

#figure(
  image("files/c6.png", width: 70%),
  caption: [A #gls("LOR") from a professor who barely remembers you is generic and weak (@sec:generic-letters)---ask people who know your research well. Source: #link("https://phdcomics.com")[PhD Comics] (© Jorge Cham).],
) <fig:lor-comic>

#gls("LOR",plural:true) are crucial for PhD because (i) they paint a picture of your research ability and potential from someone who has worked closely with you, and (ii) adcom trust the opinions of your LOR writers, who are usually faculty members or researchers who have the expertise and reputation to evaluate your research ability (@sec:LOR-writers).

#example-box[*My decision rule:* A detailed letter from an unknown researcher who supervised you closely is usually more useful than a vague letter from a celebrity. Prestige makes me notice a letter; specific evidence makes me believe it. In my actual review process (@sec:ievaluate), a letter becomes decisive when it tells me what _you_ did and why that predicts research success.]


=== LOR Writers <sec:LOR-writers>
// \sectioninfo{LOR writers should be someone who (i) can talk in depth about your research experience and potential and (ii) have the credibility to evaluate your research ability.}


Choose your #gls("LOR") writers carefully, as they can make or break your application. LOR writers are often your research advisors and professors who have mentored you in research. A *strong* LOR is from people who meet the following two criteria:

+ *Personal knowledge:* They should know you well and have worked closely with you through research projects (much preferred) or coursework. This allows them to write a letter that is _personalized_ and _specific_ to you.
+ *Credibility:* They should have sufficient expertise and reputation (@chap:research-achievements) to effectively assess and vouch for your research capabilities and potential. Ideally, your recommender should be an active researcher with a PhD or extensive research experience.



==== From Well-Known People <sec:famous-LOR> 


Having a strong letter from well-recognized researcher (@chap:research-achievements) can _significantly boost_ your application. Such letters can outweigh other weaknesses such as limited publications or low GPA. Adcom members trust people they know or have heard about and respect.  Adcom likely trusts a well-known researcher because they are unlikely to recommend someone who is not good because it would damage their reputation.

However, don't worry if you haven't worked directly with well-known researchers. A strong, personalized recommendation from someone who knows you well, even if less famous, is _far more valuable_ than a generic letter (@sec:generic-letters) from a prominent figure who barely knows you. So again, the emphasis is on _personalized_ and _research-focused_ letters---the fame is a bonus, not a requirement. 

#tip-block[
  It is fine to get letters from a postdoc or even a senior PhD student who has worked closely with you and can write a strong letter. An enthusiast letter from a postdoc who has mentored you in research for the past six months is much better than a generic letter (@sec:generic-letters) from a well-known person.
]

#tip-block[*Didier*: 
  _Should letter writers have PhDs?_  In Rwanda, a lot of students interact more with teaching faculty who might not have PhD.

  *Vu*: This is an interesting detail that US faculty might not be aware of. Students should mention this in their SOPs (@chap:sop). In general, someone with a PhD has been through the research process and therefore can better evaluate your research ability.  But if you do not have such writer, then someone who can properly evaluate your research ability is OK (and still better than someone who has a PhD but does not know you well).
]

==== Generic Letters Are Bad <sec:generic-letters>
When the writers do not know much about the applicants (e.g., just taking some course with them or not making any impression to write about), they often write a _generic_ and short letter, which is not useful and also considered weak. 

Note that _this does not mean the ref writer is not reputable or does not care about you_, but they just do not know you well enough to write meaningful things about you.

Thus it might be a good idea to directly ask if the prof. is willing to write a _strong_ LOR for you (@sec:asking-LOR). If not, then you should ask someone else.  For example, if a student I don't know well asks me to write a letter for them, I will explicitly tell them I don't know them that well to write much about them, and such a short, generic, and weak letter will not help their case (@sec:LOR-writing).

#caution-block([
  International students sometimes mentioned that some professors are unwilling to write letters or write weak ones because they do not want (good) students to go abroad or only go to places where they want the students to go to, e.g., where they have collaborators so you would continue to work for them. 
  If you are in this situation, you should find someone else to write for you.

  Sometimes students would go to great lengths just to get letters from "top" professors in their school---like department head or dean (@sec:admin-letters). But as mentioned, if these professors do not know you, their letters would likely be generic and carry little value (sometimes #alert[red flag]. Moreover, a top professor at your university might not be well-known internationally (see more details in @sec:admin-letters and @chap:your-school). So save the trouble and get letters from _any_ professors/supervisors who know you well and can write a good letter about _your_ research ability (@sec:famous-LOR). It's better to have a good personalized letter about your own research ability from someone who is less well-known than a generic and weak letter from a well-known person.
])


==== From Dept Chair, Dean, or Supervisor at Work <sec:admin-letters>

Many students, especially international applicants, try to get LORs from high-ranking administrators in their universities such as department chair/head, dean, or director. The students never worked with these people (they might take a class or so with these profs), but mistakenly believe that these LORs are valuable due to the writer's high position in the university.
However, as mentioned in @sec:generic-letters such a generic LOR has little value because the writer does not know you well and can talk in depth about your research ability. 
  
Moreover, while being well-known and respected in your local university, these writers might not be very active in research, e.g., haven't published in recent years (@chap:research-achievements). Thus they might not be well-known and recognized by adcom members.  

#example-box[
  In my experience in reviewing applications from international students, letters from admin people are often generic and do not provide much value. 
  In many case, the letter reads like it was written by a student (@sec:self-letters), and thus is a #alert[red flag].
]
  
Many students get letters from supervisors from companies where they did internships or are working.  This is OK as long as it is a research-based personalized letter. Again, the emphasis here is #highlight[_research_], i.e., the letters should describe your research experiences and potential. Letters focusing on non-research projects at a company won't carry much weight.

Finally, despite best intentions, the writers might not have the experience to write a strong LOR or lack the ability to evaluate your research ability.
This is unfortunate but common, and if you are in this situation, you should find someone else to write for you (see @sec:LOR-writers and @sec:famous-LOR).

#caution-block[*Hung*: A sad reality is that most professors in Vietnam *DO NOT* know how to write a good letter, or are lazy in writing letters hence delegate the writing to the students. Unfortunately, there is no easy solution to this problem.
]


  
==== Self-written Letters Are Bad <sec:self-letters>

Many LOR writers ask students to write their own letters---a common practice in many countries. Unfortunately, such letters have _little value_ and are considered weak by reviewers---why can you not even find someone who cares or knows enough about you to write a candid personal reference letter?  Instead of the ref. writer talking about you, in it is you who write about yourself (and they just sign the letter). 
 

Self-written letters are _easy to spot_ because an experienced professor would write differently compared to an undergraduate student.
For example, they can provide convincing and concrete examples based on their experience and compare you to their own students, and of course the writing style is different---imagine the difference between a letter written by a professor who has been writing letters for decades and a letter written by an undergraduate student who has never written a letter before, even if the student used AI and LLMs (@sec:using-ai). Worse yet, if we suspect that the student wrote the letter, it is a #alert[red flag] as we will question both the student's integrity and the letter writer's credibility (because they allow this to happen).


#caution-block[Well-known and well-respected profs would _not_ ask you to write your own letter (in fact, even not well-known ones wouldn't do this to students they care about). This might be a common practice at specific universities and the students do not have a choice as they need the letter.  However, think about this: if a prof. does this often, then they either don't know how to write a LOR (more common than you would think) or simply do not know or care enough about you.  In any case, such LORs are not useful and might even hurt your application.  So if you are in this situation, you should find someone else to write for you.
]


// % \subsection{Not having LORs from Research Advisors or Mentors <sec:no-research-LOR}

// % Sometimes students do not want to ask their research advisors or mentors for LORs, e.g., they didn't have a good relationship with them, they think that the advisors might not write a strong letter, or they do not want to reveal their intention to go abroad.  So the question is would adcom raise a concern if the student does not have a LOR from their research advisors or mentors?

// % The short answer is that, yes, we would raise a concern, e.g., th  





=== Asking for LORs <sec:asking-LOR>
// \sectioninfo{Ask for LORs at least a month before the deadline.  Waive your right to see the letter. Help your writers by providing details about your research experience and potential.}



As mentioned in @sec:LOR-writers, LOR writers should be someone who knows you well and has the credibility to evaluate your research ability. In the US, it's common for students to explicitly ask if the writer would be willing to provide a strong letter, and the writer can also be very direct in their response. If they are not willing, then you should ask someone else (and be thankful that they are honest with you).

#figure(
  image("files/no-bandwidth.jpeg", width: 60%),
  caption: [#link("https://www.reddit.com/r/gradadmissions/comments/1oibrgy/i_feel_lost_my_prof_i_worked_with_for_a_year_and/")[Reddit]!],
) <fig:no-bandwidth>

Many students get stress asking for LORs because they worry that the writers might refuse to write for them (@fig:no-bandwidth is meant to be a joke but reflects a common concern). However, in my experience, most writers are willing to write for students who have worked with them and done well. Below are some tips to approach your LOR writers:

- *Ask in advance*: You should ask for LORs _at least a month_ before the deadline. People have commitments and writing a strong LOR takes time (@sec:LOR-writing), so give them enough time to write a strong letter for you.

- *Waive your right* (@sec:waive-right): You should always waive your right to see the letter. This shows that you trust your writers and that you are not trying to twist their words.

- *Help your writers* (@sec:help-your-LOR-writers): You should tell your writers the programs you are applying to, their deadlines, etc. You can also share your SOP with them and other details about your research experience and potential.

- *Ask for feedback*: If the writer is very close to you and willing to, you can ask them for feedback on your SOP (@chap:sop) and other application materials. If the writer is a professor, they might have served in adcom committees, seen many SOPs, and can provide valuable feedback.

- *Follow up and Stay in touch*: Follow up with your writers to make sure they have submitted the letters on time. Note that their letters might have a different due date than your application (@sec:remind-writers).

After your writers have submitted all of their letters, _thank them_ (@sec:thank-writers). Let them know the outcome of your applications and stay in touch. This will help you build a relationship (@sec:maintaining-relationships), and you might need them to write for you again in the future.

==== Waiving Your Right <sec:waive-right>

When you ask someone to write a letter for you, *you should always waive your right*, which is a standard practice in both school and job applications. Waiving your right shows trust in your referees and that you're not trying to influence their words. It encourages honest feedback and keeps things confidential.

If you do not waive your right, the letter writer may refuse or write a generic letter. Adcom reviewers may question a letter that is not waived—if you don't trust your writers, find someone else. In short, waiving your right is standard and respectful.

#example-box[
If you ask me to write a letter and do not waive your right, I will refuse. I will explain why you should waive your right, but if you insist, I *will not* write for you.
]
  
==== Helping Your LOR Writer <sec:help-your-LOR-writers>

As mentioned in @sec:generic-letters and @sec:self-letters, you should not write your own letter and generic letters do not provide much value. Thus, to help your writer produce a strong customized LOR, you can provide them details or unique things about yourself. For example, let them know about your GPA, research and work experience, papers (if any), or anything you want them to mention. If the GPA in your program is highly competitive (@sec:gpa) and they know that, remind them to talk about it in the LOR. 
You can also provide them with a draft of your SOP so that they can see what you are saying about yourself and complement that with their own perspective.

Sometimes your writer will explicitly ask you for such information, but if not, you should provide it anyway (especially if you have not interacted with them much or have not done much research with them).

#tip-block[If your grading system is not standard in the US, or you are from a good school that is unknown outside your country, you can ask your reference writers to explain that in their letters. For example, the _Bach Khoa_ schools are among the top universities in Vietnam for STEM studies, but few people outside Vietnam know about them. So if you are from one, you should ask your reference writers to mention that.
]

==== Reminding Your Writers <sec:remind-writers>

After entering your writers' information in the application system, you should tell your writers about that and let them know they will soon receive an email from the university to submit their letters. You should also tell them when you submit your application and remind them to submit their letters on time if they haven't done so.

Note that many places only have deadlines for the applicant, but are very flexible with the letter writers. In these cases your LOR writers _might not even be given any deadline_. @fig:LOR-invitations-no-deadline and @fig:LOR-invitations-deadline give examples of LOR invitation emails I received from various universities in the past few years.


#example[LOR invitations *with NO deadline*][
*Sample 1 (UMass, no deadline):*

.. is applying for admission into the Computer Science (Ph.D.) program in the Graduate School at the University of Massachusetts Amherst and has listed you as a reference.

_They have waived their right of access to see your reference._

You may submit your reference online via the Graduate Reference Center, which is located at .. Please use the email address and code shown below to log in to submit this reference.

A timely response is important for this applicant to be favorably considered. Please be aware that the applicant's admission could be contingent on your prompt response.

*Sample 2 (UIUC, No deadline):*

Dear ..

.. has requested that you write a letter of recommendation for their Illinois graduate application. We greatly appreciate your feedback on X's ability to succeed in their graduate studies at Illinois.

In an effort to make this process as easy as possible for you, we offer the ability to upload your recommendation letter online through our secure website. To submit your recommendation, please use the link below. This link is unique to this recommendation and should not be shared or forwarded.

Thank you!

*Sample 3 (UNL, No deadline):*

.. is applying to the University of Nebraska-Lincoln and has named you as a recommender. _This applicant has waived the right to view your recommendation._

Please complete our brief recommendation form (or if necessary, decline to recommend).

Should you experience any technical difficulties or require assistance with your account, please contact CollegeNET Support.

Thank you.
] <fig:LOR-invitations-no-deadline>

#example[LOR invitations *with deadline*][
*Sample 4 (MIT, With deadline):*

Dear Dr ..

.. has listed you as a reference in an application to the EECS graduate program at MIT. If you are not .., please ask .. for the correct letter submission information. Please submit your letter here: ..

The deadline for the applicant is *Dec 15*; we start the admissions process immediately after that date, so we would appreciate receiving your recommendation by then. The applicant can see if you have submitted a letter, and may remind you.

Even though the applicant knows the link for submitting a letter, the applicant is unable to read your submitted letter. The https URL ensures that you connect to MIT's graduate admissions server. That server accepts letter submissions, but will not reveal a submitted letter.

Thank you!

*Sample 5 (CMU, With deadline):*

Dear Recommender,

The applicant listed below has applied to a graduate program in the School of Computer Science at Carnegie Mellon University and has requested a letter of recommendation from you.

Applicant: ..

Click Here if your mail system provides html content or use the URL below to enter your letter of recommendation in PDF form only.

Your letter of recommendation is due by *12 p.m. (Noon) EST on December 10, 20XX*. Thank you for taking the time to respond.
] <fig:LOR-invitations-deadline>

Also, many places do not begin the admission review process right after the deadline and work on application reviews in the next semester (mid-January).
Thus while you do want to send reminders because professors can be quite busy (@sec:busy) and forget to submit their letters, especially when there is no explicit deadline, you should not send too many reminders as that can be annoying to the writers.

==== Thanking and Updating Your Writers <sec:thank-writers>

After your application is submitted and your writers have submitted their letters---i.e., the wait begins (@part:after-apply)---you should send quick _"thank you"_ notes to your writers. This serves both as an acknowledgement that you know they have submitted the letters and as an appreciation for their help.

You should also update them with the outcome of your application, regardless of whether you are admitted or not. In addition to being a common courtesy, this can also help maintain a good relationship with your writers (@sec:maintaining-relationships), which can be useful in the future (e.g., if you need another letter for another round of applications or for a job reference).

More generally, you should do the same for anyone who has helped you during the application process, such as profs. who provided advice, mentors who guided you, and friends and family who supported you.

==== Will It Be Annoying If You Ask For Many Letters? <sec:many-letters>

As mentioned in @sec:my-LOR-perspective I personally do not mind writing many letters for my students *once I have agreed to write for them* (@sec:LOR-writing). Profs. in general are used to writing many letters, especially during the application season. Moreover, once a letter is written, it can be _reused_ for multiple applications, so it does not take much time to submit the letter to different universities (no more than 5 minutes per submission).

However, some cases might raise some eyebrows, e.g., if you only aim at very top schools that the writers believe are not a good fit for you, or if you apply to too many schools (30+?) then the writers might question your seriousness or your ability to get into these schools. In short, don't overdo it, but applying to 10--15 schools is perfectly fine and common.



#note-block[
For Vietnamese students, it's worth mentioning the #link("https://vef2.org/")[VEF2.0 program], which has helped many students gain admission to good CS PhD programs in the US. VEF2.0 invites US faculty members from leading institutions to conduct rigorous interviews with VEF students and subsequently provide LORs on their behalf. Despite the limited interaction between the interviewer and the interviewee (primarily just the interview), these letters are very effective and have helped many students get into good PhD programs because they are from well-known US faculty members and are personalized to the students' research interests and potential (even with limited interaction).
]


=== My Perspective <sec:my-LOR-perspective>
#note-block[In this #link("https://www.reddit.com/r/gradadmissions/comments/1p0lkim/perspective_on_LORs_after_sending_a_big_batch/")[Reddit post], I provide my perspective about LORs and what I expect from my students when they ask me to write for them.  You can share this with your writers if you think it is useful. 
]

#example[How Do I Write a LOR?][

If a student asks me to write letter for them, I will generally agree as I believe it is my responsibility. I will ask them to waive their right to see the letter (@sec:waive-right), and will not write if they do not do so.

I will also let the student know if I cannot write a strong letter for them (e.g., I don't know them that well), and suggest they find someone else.  If they insist, then I will write for them. While I try to say something positive, e.g., the student is hardworking and receive good grades, the letter will still be short and weak (@sec:generic-letters). Usually it takes me about *5–10* minutes to write such a "weak" letter.

Strong letters will require a lot more time and effort as it will be personalized.  While I have a general template for LOR, it still can take me *half an hour or more* to write it.  I often ask the students to provide information (@sec:help-your-LOR-writers) and what they think I should highlight in the letter. They can also provide me their SOP (if they already have written one) so I can complement what they say with my own perspective.  I often do not share what I write with the students, just to keep it more genuine and honest.

My letter always has the university letterhead and my signature.  While having a letterhead or signing the letter is *not required* (I never paid much attention to these when reading LORs), it makes the letter more official and professional.  
This website has the template of the letter with letterhead and signature: #link("https://www.overleaf.com/read/xzyrxkdjfxsp#2a1f9e")[Overleaf template].

I (and most profs.) often do not write a new letter or customize the letter for each application or school. Instead, I write you a LOR, which is customized for _you_, but can be used to apply for multiple schools (e.g., "Dear Admissions Committee", instead of "Dear _MIT_ Admissions Committee").

Finally, I usually submit a letter for a student in *batch*—submit to all universities that student is applying to at the same time). Typically, each submission takes about 1–5 mins, depending on the application system.  I will also let the student know when I have submitted the letter, and ask if I miss any.
] <sec:LOR-writing>


#pagebreak()

== Research Experience (e.g., Publications) <chap:research-experience>
//#chapter-opener([Publications are not *required* but can *greatly help*. Papers in good venues are concrete evidence that you have successfully engaged in research.])

#simpsons[I've got to study harder and publish faster!]

Here we look at publications and other research experiences that can strengthen your application.
@chap:research-opportunities provides more information on how to find research opportunities, e.g., during your undergrad or MS study.


=== Publications <sec:publications> 

#figure(
  image("files/wu.jpeg", width: 70%),
  caption: [Applicants to top CS programs have multiple first-authored papers at top places.]
) <fig:wu>

The most concrete evidence of research ability is having *papers in reputable international conferences or journals*.
Having published papers, especially at top venues, is a sign that you have been successfully involved in research.

Publications are #highlight[never required] for PhD application. _However_, given the competitiveness of CS admission, they can significantly strengthen your application and _are becoming the norm_ for top PhD programs. Applicants admitted to top schools, especially in popular fields such as ML and NLP, often have multiple first-authored papers at top places. @fig:wu shows examples of applicants to Stanford CS PhD.

#paragraph[Not the First Author][Being the #gls("first-author") typically means you own the work and therefore know the research well. However, it's *perfectly OK to be second or third or even last*. #gls("adcom members", capitalize: true) know it is difficult to publish a good paper, and so being a co-author is still a good sign about your research experience. In any case, especially when you're not the first author, you should explain the work and your contribution. Better yet, have your #gls("LOR") writers (@sec:help-your-LOR-writers) talk about your work and contributions in their letters.]

#paragraph[Publications Not Relevant To CS or Your Research Interest][
If you have published papers in other fields, e.g., physics, math, or even CS but not in your research interest, you should still talk about them in your #gls("SOP") (@chap:sop) and upload them as writing samples (@sec:writing-sample). Also, have your #gls("LOR") writers (@sec:help-your-LOR-writers) talk about them in their letters.
While not as strong as CS publications, they still show your research ability and experience, which is what adcom members care about.]


#tip-block[*Thanh*:
  Due to academic culture, professors in Vietnam usually aim for (international) journals instead of conferences. Could you give some tips on how to know whether a journal is good (CSRankings, unfortunately, only considers conferences)?

  *Vu*: One way is looking at where well-known researchers publish. For example, if you are interested in a field X, you can use CSRankings (@sec:csrankings) or CSPicks (@sec:cspicks) to look at active faculty in X, and then look at their websites to see where they publish at.
]

#caution-block[
  International students often mention #gls("Q1"), which consists of various journals from IEEE, Elsevier, and many other publishers. I don't know/recognize many of the journals listed in Scopus Q1. This might be something to be mindful of, as *CS* faculty might not be too familiar with Scopus or journals listed there, so devote some part in your statement to discuss the significance of your papers.
]

=== What If You Don't Have Any Publications?

Many students do not have the opportunity to publish papers. Thus, other writings, even those under submission or even rejected, would still help. 
Be sure to upload these with your application (@sec:writing-sample) and mention them in your SOP (@chap:sop). Adcom members can quickly skim over the paper and determine its quality (@sec:ievaluate).

Note that local conferences and non-English journals or conferences do not carry as much weight since their quality is often unknown. However, if you have published in such places, you should still upload them as writing samples, mention them in your statement, and explain why they are good.

#tip-block[*Craig*:
  GMU and many other universities allow you to upload your published papers and other writing samples (@sec:writing-sample). In many cases, even if the papers were not published at top places, we can still determine their quality by simply skimming over the paper.
]


=== Work Experience

Research experience at _well-known research laboratories_, such as Microsoft Research, can strengthen your application. The emphasis here is _research_ work, not software development or non-research work. For example, working at a FAANG (Facebook, Amazon, Apple, Netflix, Google) company as a software engineer does not count as research experience. While it can be helpful for MS applications (@chap:ms), software development, even at a top company, does not demonstrate your research ability and potential for a PhD program.
 Similarly, a LOR from your supervisor for non-research experience might not count much (@sec:admin-letters). So do not spend much time talking about development job in your #gls("SOP").


Note that adcom reviewers might not be familiar with all research labs, especially those outside the US. For example, while VinAI is well-known in Vietnam and potentially in Asia, it might not be well-known in the US. So you or your #gls("LOR") writers should explicitly say something about them in your statement or ref. letter.  In general, if you did good research work, then you should mention that in your SOP and ask your supervisor to write about it in their LOR (@chap:LOR).


=== Competitions <sec:competitions>

Winning _internationally recognized competitions_ can help your application as they demonstrate your ability to solve challenging problems, which is crucial for research.
For example, participating in Math Olympiads if you want to do theory or winning ACM programming contests if you want to "build" systems (e.g., research prototypes).
So do talk about them in your SOP (@chap:sop) and have your writers mention them in their LORs (@sec:help-your-LOR-writers).

#pagebreak()
== Statement of Purpose (SOP) <chap:sop>
//#chapter-opener([SOP is important. Write it in such a way that makes you *stand out*.])

#simpsons[All my life I've had one dream: to achieve my many goals.]

#figure(
  image("files/c2.png", width: 90%),
  caption: [What _not_ to write in your #gls("SOP") (@sec:kiss-of-death-sop). Source: #link("https://phdcomics.com")[PhD Comics] (© Jorge Cham).],
) <fig:sop-comic>

While you might not have control over LORs (@chap:LOR) or where you go to school (@chap:your-school), you do have control over your #gls("SOP") or personal statement. A well-written SOP also demonstrates that you can communicate effectively, which is crucial in research and important for GTA funding (@chap:funding). Many SOP samples for CS are #link("https://cs-sop.org/")[available here].

#caution-block[*What applicants get wrong:* An SOP is not an autobiography, a motivational speech, or a love letter to Computer Science. It is an argument that you are ready to become a researcher and that this department has a plausible place for you. If the statement gives me no concrete sentence I can use to advocate for you, it has failed (@sec:ievaluate).]

In your SOP, focus on research potential (@chap:research-experience) and convince reviewers through your experience, e.g., published papers (@sec:publications). Back up your claims with *concrete evidence*. For example, if you say you have teaching experience, show what you did, e.g., undergraduate TA or mentoring someone. If you say you worked on a research project, show some results, e.g., paper submitted (or even rejected), achieved certain performance improvement over the state of the art.

You should talk about things that adcom members might not know about and that can help make you _#highlight[stand out]_ in the application pool of thousands of applicants, e.g., your personal GitHub project with hundreds or thousands of stars or your regular contributions to well-known open-source projects (see @sec:stand-out for increasing your admission chance).

Finally, this is a simple but often overlooked task: *tailor your SOP to the institution you're applying for*, e.g., why apply *here*? Who do you want to work with? Provide names of professors you're interested in (if they are not already in the adcom, your application might get forwarded to them for evaluation; and they might be interested in interviewing and recruiting you). This shows that you're serious and have done homework on places you're applying to. Adcom will look for this part (@sec:why-rejected).

#tip-block[
Have your SOP reviewed by your LOR writers (@sec:help-your-LOR-writers) and professors, especially those who have served in adcom, or even postdocs or PhD students as they have been through this process.
]
#example[*Jeff Erickson* (UIUC) through a #link("https://www.reddit.com/r/gradadmissions/comments/1owtfgl/comment/nosxvdm/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1")[Reddit post]][The main thing that I (and other CS faculty) look for in application statements is concrete evidence of research potential. I don't want you to *tell* me that you're excited/motivated/passionate about computer science research. I want you to *show* me your specific interests and your investment/commitment. I want your statement to *demonstrate* your technical background, self-awareness, clarity of thought, intellectual (and ideally emotional) maturity, independence, creativity, discipline, attention to detail, willingness to take risks, and understanding of what research actually is. (Hint: Not just more homework.) I want you to show enough investment in your specific research interests to describe them in credible technical detail.

  In particular, I do not want to read about how many programming languages you know, or stories about how you've been coding since the womb, or starry-eyed platitudes about how artificial intelligence is the best thing since sliced bread, or about your goal to be the next Geoffrey Hinton or Terry Tao. Nothing about your first trembling steps.

  You are applying for a job. I want evidence that you are likely to do that job well. I don't want to be entertained. I want to be *informed*.
]

#caution-block[Do not mention _emeritus_ or _adjunct_ faculty as intended primary advisors (@sec:faculty-types), send a statement naming professors at another school, or write about George Washington when applying to George Mason. I have seen all of these mistakes. They tell me that the applicant did not perform even the most basic research before asking us for five years of support.]

=== Kiss of Death in SOP <sec:kiss-of-death-sop>


#figure(
  image("files/is-this-sop-enough.jpeg", width: 70%),
  caption: [Is this SOP enough (#link("https://www.reddit.com/r/gradadmissions/comments/1p2ggxu/is_this_sop_enough/")[Reddit])? No, a broken heart emoji looks desperate. You need to stand out!],
) <fig:is-this-sop-enough>

- *Too personal:* Don't talk about your personal issues, e.g., family, health, relationship, etc. This can raise concerns about your ability to handle the PhD. Also, don't talk about religious or political beliefs (@chap:cultural).

- *Criticizing* your current or previous institution or professors. Just like in a job interview, don't badmouth your current or previous employer because it raises concerns about your ability to work with others.

- *No concrete evidence to back up claims:* For example, saying you are passionate about a research topic without showing any experience. This is where specific names (work submitted at conf. X), numbers (outperformed SOTA by Y %), and examples (worked on project Z) can help. These names, numbers, and stats are harder to fake and concretely show your experience and potential.

- *Use flowery and AI-like language.* Don't use AI to write your SOP (@sec:using-ai). Not that hard to raise suspicion. Though you can ask AI to check your grammar and spelling.

- *Not customized to the program:* If your SOP can be sent to multiple programs with few changes, it is too generic. Do some research and mention why you want to spend the next 5–7 years there.

- *Mentioning wrong professors:* Do not mention emeritus professors or those who have left. Teaching and adjunct faculty are often not active in mentoring PhD students (@sec:faculty-types). Do your homework and mention profs who are still active in research.

- *Too Long and Fancy Format:* Keep it under 2 pages#footnote[May vary but this is my personal preference.]. Don't use too much coloring or fancy fonts (like those in Word). Don't use left alignment (seems to be default in Word) as it is hard to read.

CS academics like using LaTeX (common way to write our papers and other documents), so write your SOP using LaTeX (with Times or default font, 11pt, and 1-inch margin as described in @chap:writing-latex).



=== Diversity Statement <sec:diversity-statement>

Some universities require a *#gls("diversity-statement")*---an essay about  Diversity, Equity, and Inclusion (DEI)---as part of the application. While the topic of DEI has become politically contested in the U.S., you should be prepared to address it when asked. 
Many students, especially international ones, find this statement confusing because they are unsure what it is about (truth is, even people in the U.S. struggle with this topic).

At a high level, a diversity statement is _not_ an ideological endorsement, but rather a way to assess your _awareness_ of DEI issues, _understanding_ of challenges faced by minority groups, and potential _contributions_ you can make.

- *You don't have to be from a specific DEI/minority group.* You just need to understand what DEI is, e.g., be aware of challenges faced by minority groups in studying CS, STEM fields, academia, and the workplace. Show that you are aware of DEI issues and how they impact your chosen field and society.

- *Show your awareness, customized to your own experiences.* If you come from a different culture or country, talk about DEI (or lack thereof) there. You have a unique perspective that adcom might not know about and would be interested in hearing.

- *Highlight your contributions.* You do not need to be in any group or organization specific to DEI. You can talk about your contributions to your community, e.g., mentoring students, organizing events, or even just helping people in need. If you don't believe you have done anything much, then talk about what you plan to do.

- *Customize it to your application.* Think about your research or teaching: could it indirectly support or create collaboration across under-represented groups? Could you mentor students from underrepresented groups? Could you help improve access to technology or education in underserved communities? These are all valid and meaningful contributions.

#caution-block[
  One common pitfall is to write about how you are from a poor family, a small town, or a developing country. These are not related to DEI and show that you do not understand the topic. I have seen people consider themselves as minority because they are Asian or international students studying in the US (have you seen how many Asian or international students are in CS programs?).

  Moreover, _do not_ make up stories or exaggerate your experiences. Just #highlight[show your awareness and understanding] of the topic and what you did or how you plan to contribute. A good diversity statement I've read starts by the acknowledgement that the applicant is not a minority, but a white male in a STEM field (i.e., they are the majority), and that they do not have much experience in DEI, but show that they are aware of the challenges faced by minority groups and how they can contribute.
]

#pagebreak()
== Your School and Grades <chap:your-school>
//#chapter-opener([Your schools might not as well-known as you think. High grades probably won't help much, but bad ones likely will raise concerns.])

#simpsons[Woohoo! I'm a college man! I won't need my high school diploma anymore]

=== School
Graduating from top universities _that adcom members recognize_ helps quite a bit.
The emphasis here is #highlight[_"that adcom members recognize"_]. The reason is similar to #glspl("LOR") from well-known researchers (@sec:famous-LOR): if we know your school has a good reputation, we can trust its education and grades. Otherwise, we are uncertain about the quality of the school and the grades you received.

For example, if you are an international student and your school is well-known, then it is considered _"top foreign"_, which is a plus. However, if we do not know much about schools in your country, then we are uncertain about the quality of your school and likely treat your school as _"unknown foreign"_, which can be a minus point.

Many international students mistakenly assume that their school is well-known, but in fact, it is not (@sec:why-rejected). For example, although "Bach Khoa" is one of the best universities in Vietnam, it is not commonly recognized in the US---their confusing acronyms HUST and HCMUT only make it worse.

If you think your school has a strong reputation, mention it in your SOP with concrete evidence like rankings or awards. You can also ask your LOR writers to talk about your school (@sec:help-your-LOR-writers).

Of course, if you're interested in working with Vietnamese, consider #link("https://roars.dev/phd-cs-us/viet-cs-profs-us")[CS programs in the US that have Vietnamese professors].

#example-box[
  Sometimes PhD adcom in the US will share a document such as #link("https://github.com/dynaroars/dynaroars.github.io/wiki/Foreign-Top-Schools")[this one], which lists the top schools in several countries. We also ask other faculty and students if we think they know about the place. For example, when I was a postdoc at UMD, members of their CS PhD adcom asked me to evaluate applicants from Vietnam. During my time at UNL and now here at GMU, I have looked at Vietnamese applications (whether they are assigned to me or not) and provided input to their reviewers, e.g., X is the top tech school in Vietnam and so it should be \emph{top} instead of \emph{unknown} foreign, which makes a huge difference.
]
#tip-block[*Deepak*:
  If an applicant is anxious about their school not being known outside their country, they can provide information about their school and department, with independent sources where such information can be verified.
]
=== Grades <sec:gpa>

Compared to other factors such as LORs (@chap:LOR) and research experiences (@chap:research-experience), grades generally do not matter much for CS PhD admission. In fact, many CS faculty members themselves have bad grades in undergrad courses (and some were proud of that!).

#note-block[
  #link("https://jeffe.cs.illinois.edu/")[Jeff Erickson] (UIUC) has an undergraduate GPA (2.4/4.0) and wrote a #link("https://jeffgerickson.substack.com/p/re-phd-with-low-gpa")[blog] about it.
]

==== Good Grades Won't Help Much <sec:good-grades>

PhD in CS is a research degree and doing well in courses does not necessarily mean you can do research---other factors such as research experiences, pubs, LORs are more important. Thus, do not assume that having a high GPA (e.g., 3.8/4.0 or 9.0/10) will help much in your application.

That said, if you are from a well-known school (@chap:your-school), having good grades _might_ help, e.g., adcom members often note details such as "good GPA from well-known school (@sec:ievaluate)". However if your school is not well-known, having top grades or rankings usually will not help because we cannot evaluate them (e.g., we don't know how hard it is to get a 4.0 or A's at your school). This can be an issue for students in many top international universities where the competition is so high that very good students can still have low rankings from these schools (and be overlooked by adcom).

As with school reputation, you and your LOR writers can mention the grading system of your university if you think that is helpful for adcom to evaluate (@sec:help-your-LOR-writers).

#note-block[*Thanh*:
  Vietnamese universities typically offer specialized programs, such as the talented engineer program at HUST, that have highly competitive entrance exams and a limited number of available slots (e.g., 30 per year). However, these programs often set higher requirements for students, including more demanding tests and assignments, resulting in lower GPAs and overall rankings. For example, 3.5 GPA students from such talented programs are typically much better than 4.0 GPA students not in those programs. Similarly, variations in GPA standards exist among different universities, with technical universities generally having lower GPAs than economic universities. These make gaining admission in the US difficult as US faculty are not familiar with these issues.
]

==== Bad Grades Likely Will Hurt

While having good GPA might not help much (@sec:good-grades), #highlight[_having bad GPA will likely hurt your application_]. If you have bad grades, you should explain them in your SOP, or better yet, have your LOR writers explain them in their letters if they know the reasons.

Moreover, having bad grades in relevant courses, e.g., Math and CS, can be a red flag.
Adcom members often scan through transcripts (@sec:ievaluate) looking for C and lower grades in Math and CS courses and raise concerns if they see several of them.
Note that bad grades in non-relevant courses, e.g., politics or history, are not as concerning.

Should you explain bad grades in relevant courses in your SOP? If you have just a few, they do not matter much, so don't spend much time explaining them (many adcom reviewers themselves have bad grades in relevant courses!). But if you have many bad grades for an entire semester or year due to some specific reasons, then try to explain them in your SOP.

#paragraph[Below Minimum Requirement][Many universities have a minimum GPA requirement (e.g., $> 3.0$) and will automatically reject applications with GPAs below the requirement (@sec:why-rejected). This means adcom members might not even see your application if your GPA is below the minimum requirement.]

#warning-block[
  GMU College of Engineering and Computing requires a minimum GPA of 3.0/4.0 for PhD applications, and will _autoreject_ applications below this threshold.
]

#pagebreak()
== Standard Tests (GRE and IELTS) <chap:standard-tests>
//#chapter-opener([Standard tests are *not* important. #gls("GRE") typically *is not* required. For standard English tests (not required for domestic students), just do enough to pass the minimum requirements.])


#simpsons[I've got to study harder. Everyone knows standardized tests are biased against the poor, the lazy, and the stupid.]


=== GREs Are Optional and Do Not Matter for PhD Admissions <sec:gre>

While a few schools still require taking the #link("https://www.ets.org/gre")[GRE] exam (e.g., UCF), most good CS PhD programs in the US #highlight[do not require it]---the #link("https://www.science.org/content/article/gre-exit-gains-momentum-ph-d-programs-drop-exam-requirement-amid-pandemic")["GRExit"] trend. The reason is that GRE scores do not correlate well with research ability (@chap:research-experience), which is the most important factor for PhD admission. Note that many faculty members themselves did not take the GRE or had bad scores.

Thus, if you have bad GRE scores or haven't taken the GRE, then don't _waste time_ (re)taking it. Being optional really means optional, and not taking it will not hurt your application.
However, if you took it and have really good scores then it might be worth it to include (and perhaps talk about) them in your application, but don't expect them to make much difference. But if your scores are bad, then you should not include them in your application, which can be a #alert[red flag].

#caution-block[
  I often see students asking about GRE requirements on internet forums or Facebook groups, only to get completely incorrect answers. Some people insist that you "need" to take the GRE or be in specific high range to get a chance.
  Some of these people are from other non-CS disciplines that do require GREs. Ignore these! GREs are *neither required nor valuable* for CS PhD admissions today. Maybe 20 years ago (e.g., when I applied in 2007), but not today---the GRE requirement has been obsolete for a long time now, e.g., many CS faculty---especially younger ones---have never taken the GRE themselves.

  Also be careful that some people are trying to talk you into paying for (their) GRE prep or PhD admission "consulting" services. Don't fall for these and waste your time. There are far more important things than the GRE that you should focus on for CS PhD admission such as your LORs (@chap:LOR) and research experiences (@chap:research-experience).
]

Note that while GRE is not important for CS PhD admission, it might be required or important for MS admission (@chap:ms). This is because MS programs are more course-based and thus care more about grades and standardized tests.

=== English Tests (IELTS, TOEFL) <sec:english-tests> 

Unless your degrees are from the US (e.g., you did your undergrad or MS in the US), or certain countries such as #link("https://www.gmu.edu/international/english-language-requirements")[these], you will likely need to take standardized English tests. On one hand you will need to show some level of English proficiency; but on the other hand, you do not need to have very good scores in these tests (many adcom members themselves were once international students and struggled with English).

#tip-block[You might wonder why you need to know English well when you focus on CS topics that are mainly math and programming.  
  As you will see in your PhD study, you will need to read and write a lot, and the papers you read and write will be in English.  You will also need to communicate with your advisor, collaborators, students, and other people.
  
  Also, the university often requires a certain level of English proficiency for GTA (@sec:ta), as you will need to communicate with students. 
]

Just as with grades (@chap:your-school) and GRE (@sec:gre), having high scores in English tests might not help, but having too low scores can be a #alert[red flag] and can result in an automatic rejection (@sec:why-rejected), e.g., below the minimum requirement.

#note-block[
  Here is the minimum requirements at GMU. 
  Being above this might not mean much, but below is a #alert[red flag].
  - *GPA:* $>= 3.0$ in your undergrad (but we also consider the rank/prestige of your school)
  - *GRE:* not required 
  - #link("https://www.gmu.edu/international/english-language-requirements")[English proficiency requirements] (one of the below)
    - TOEFL: 80 OR
    - IELTS: $>= 6.5$ OR
    - Duolingo Graduate English: $>= 120$ OR
    - Pearson Test of Academic English: $>= 67$
]
#pagebreak()

== Other Materials <chap:other-materials>

#simpsons[I'm not a college graduate. I'm not even a high school graduate. But I'm a pretty good judge of character.]

=== CV <sec:cv>
// \sectioninfo{Highlight and summarize major achievements such as major publications and competitive programming awards.}

Most schools allow you to upload your CV with your application. The main difference between a CV and a resume is that the former is more comprehensive and longer, while the latter is shorter and focuses on job-related experiences. So you don't need to adhere to the 1-page rule of resume in job searching; CV has no such requirement and is often longer.

Use your CV to summarize your achievements, e.g., publications, awards, and teaching experiences. You can also list your personal website, projects, or contributions to open-source projects (@sec:personal-website).
Prepare your CV in such a way that allows reviewers to quickly scan to identify major achievements.

#tip-block[
  Most students do not have much to put in their CVs. Thus adcom members usually do not pay much attention to CVs (and definitely do not screen applicants based on them). So do not spend too much time on your CV, just make sure it is easy to skim through (@sec:ievaluate) and well-organized around research activities and achievements.
]

=== Writing Sample <sec:writing-sample>
It is a *good idea* to upload a writing sample, e.g., a paper you wrote, a report, or a thesis. Whether the paper is published, unpublished, on arXiv, or even rejected (but you think it's good), you should upload it. Because samples are part of the application package, adcom members can quickly skim through it to see your research and writing abilities.

A quick read through a writing sample can reveal a lot about your research work and writing skills, which sometimes are not well presented in your SOP or LORs. But of course if your writing sample is not good, then it can hurt your application. So make sure you upload something serious and well-written.

=== Online Courses and Certificates

These do not carry much weight as they do not show research ability. We do not care much if you have taken an online Coursera AI course or have a professional certificate from Microsoft.
However, as mentioned in @sec:non-stem, if you do not have a CS background, you might be able to use these to show you have sufficient CS knowledge.

=== Personal Website and GitHub Projects <sec:personal-website>
These are _not_ required but are increasingly common. In CS, academic websites are _very_ common and used to showcase research, publications, and projects. You don't need fancy websites with tons of JavaScript and animations. A simple website with your name (and sometimes photo), research interests, publications, and projects is enough. You can use free services such as #link("https://github.io")[GitHub Pages] to create your website. Many CS students also use GitHub to host their projects and demonstrate their involvement in open-source projects.

You can mention your website and projects in your CV (@sec:cv) and SOP (@chap:sop).
Having popular projects or active contributions can help you stand out (@sec:stand-out), especially if you do not have much research experience.

#tip-block[
  Many students include LinkedIn (or Facebook and X/Twitter) profiles in their applications. While these might be popular when applying for jobs, they might not be very useful for PhD application evaluation. Adcom members might not be familiar with LinkedIn (and might not want to visit a page that requires an account and login), so it is better to have something like a personal or project website, which is far more common and easier to access.
]

== Using AI and LLMs in Your Application <sec:using-ai>


As AI and LLMs become more popular, many students wonder if they could use AI chatbots such as ChatGPT and Claude to help with their application materials, especially statements. Of course, they worry if the university or adcom reviewers would check and penalize them for doing so.

Nowadays it would be naive to tell you or any student to ignore AI (and frankly I use these tools myself extensively). So the question is not whether you can use AI, but how to use it properly.

// I think it is _fine_ to use AI to help your writing, e.g., the _"proofread"_ feature in Apple's `Writing Tools` is quite useful for fixing writing issues or finding better terminologies or phrases. 
// This can help international students who might struggle with writing English and are not familiar with the academic writing style (you see how many _"thus"_ used in this book?). 
// In addition, asking ChatGPT or Claude to help you brainstorm ideas, organize your SOP, or edit/critique your draft is also fine. 
//Thus, it's OK to use AI to help you but you should be the main part of the writing loop, i.e., you should be the one who writes the content and use AI to help you improve and refine it.


#paragraph[How to Use AI][The key is to #highlight[use AI as an editor and brainstorming partner, not as a replacement for your own thinking]. You should write the first draft yourself, in your own words, with your own examples. Then use AI to improve that draft. If you start from a blank page and ask AI to "write me an SOP," you have already lost the one thing that makes an application stand out and become memorable---*you*.]


#paragraph[Where it goes wrong][The problem is not AI itself; it is _outsourcing the thinking_. Adcom members (@sec:adcom) read hundreds of essays, and AI-written SOPs have a recognizable flavor: generic enthusiasm, vague claims, flowery phrasing (_"I have always been deeply passionate about the ever-evolving landscape of..."_), and no _specific detail_ about _your_ research and story. A SOP like that is a kiss of death (@sec:kiss-of-death-sop) because it is instantly forgettable.]

//The thing that makes an SOP work---a concrete story about a project you struggled with, a specific reason you want to work with Prof. X---is exactly the thing AI cannot invent for you. If you let it, you will produce a polished essay that is instantly forgettable.]


#paragraph[Checking for AI content][Some students worry that adcom reviewers will check their SOPs for AI content. 

Personally I _do not_ check your statements for AI contents. First, I do not have the time to do that. It is much easier for me to just read the statement and see if it makes sense and stands out (@sec:ievaluate). Hint: AI-generated content reads very strangely and faculty is just too experienced in reading essays and SOPs from students to not notice it.  In addition, AI-checking technology is very unreliable and inconsistent. For example, a checker might claim that 80% of an essay is AI-generated while another says it is 0%. So we cannot rely on these tools to determine if a statement is AI-generated or not. Finally, as mentioned, I think it is fine to use AI to help you improve your writing, so I do not see a reason to check or penalize students for using AI to help them write their SOPs.
]


#pagebreak()
= After You Apply <part:after-apply>

== Interview and The Waiting Game <chap:interview>
////#chapter-opener([Getting an interview is typically a good sign; but no interview does not mean rejection.])

#simpsons[Bart: "Are we there yet? Are we there yet? Are we there yet?"

Homer: "No!"

Bart: "Okay, how about now?"]

After you submit your applications, the waiting game begins! For many students, this is a very stressful time. This section provides some information and tips to help you get through this time.


#figure(
  image("files/bingo.png", width: 50%),
  caption: ["Grad-admissions bingo"---the anxious questions applicants obsess over while waiting (a late #gls("LOR"), a low GPA, "am I too old?", rolling interview invites, using AI).],
) <fig:bingo>

=== Interviews <sec:interviews>

After you apply, you _might_ get interviews. The most common case is that a specific prof. is interested in working with you and wants to chat, e.g., to offer RA (@sec:ra). In some cases, the interview is done by several professors, e.g., to see if a student fits in their group or to recruit a very strong student to their program.

Note that unlike other fields (e.g., Physics as shown in @fig:adcom-discuss-physics) that has formal interview where adcom members interview selected applicants to accept them in the program, CS interviews are usually with just one prof. or a few profs.---who might not adcom members---that have interests in recruiting specific applicants to work directly with them or their research group. In CS, adcom members rarely do interview to get students for the program as a whole.

==== When Do Interviews Happen?

The timeline for interviews varies.  Faculty set up interviews based on their busy (@sec:busy) and erratic schedule. Some try to get interviews done before the winter holidays, while others do them after the holidays.
Do not be surprised if you get an interview invitation at the last minute. Some profs. are informal and may just email you to chat (e.g., _"could you chat in an hr?"_), while others might give you several options (e.g., _"can you chat at 2 pm on Friday or 10 am on Monday?"_).


Some programs _do not do interviews_ at all (@sec:no-interview). They review applications and make decisions based on them.  If you do not get an interview, it does not mean you're out.

#note-block[
    At GMU, faculty are encouraged to interview candidates. While we can interview as many as we want, we typically interview those we are interested in working with. In some cases, several faculty members interview a candidate together to evaluate if they fit well in their research group. For very strong candidates, the interview is actually to recruit them.  
    In some rare cases, the adcom chair might ask specific adcom member or faculty to interview certain candidates to get more information about them for admission.
        
    In short, getting an interview is a good sign; it means that someone is considering you. If we are not interested in your application, we will not waste our (and your) time interviewing you.
  ]

==== Preparing for Interviews

Typically, an interview takes about 15--30 minutes, and one important aspect of evaluation is your ability to effectively communicate, including speaking and understanding English. 
You might be asked to talk about your research experience and interests and to read a paper and discuss it. In some rare cases you might also be asked to solve a problem (one of my colleagues at GMU likes coding interview).


You should treat the interview as an informal chat. Prepare an _"elevator pitch"_ about your research experience and interests. You might also want to have a 5-minute presentation about your research. If a prof. asks you to read a paper, do it and be prepared to discuss it. You should also ask if you need to prepare for coding. Finally, the interview gives you an opportunity to ask questions, e.g., about the program and the professor's research.  You should definitely ask as it shows that you're interested.  See #link("https://roars.dev/phd-cs-us/advising.pdf")[some questions] you can ask about the #gls("advisor") and their advising style.

==== After the Interview

#paragraph[Follow-Up Emails][If you had an interview and have not heard back, you can email to ask about the status of your application. See @sec:accept-postpone-decline for how to check status and follow-up emails.]


#paragraph[Updating your profile][If you have important  achievements after you submitted your application, e.g., new top publications or big fellowship awards, you can mention to your interviewer. If you did not have interviews, you can try to ask the CS dept to update your application (though no guarantee that they will consider them). However, in general, you should not send emails to update your profile unless you really have important updates.]

=== Not Getting Interviews <sec:no-interview>
While in general it is good to get an interview, not getting one *does not* mean you're out. Many programs do not have the tradition of interviewing applicants. For example, at GMU, most admitted students with GTA (@sec:ta) do not go through interviews.

However, no interview usually means you are less likely to get a GRA (@sec:ra), which is typically offered by an individual faculty member. If they want you to do research with them, they will likely interview you first. If you have no interviews, your application (and GTA/fellowship funding) is decided by the adcom.


=== Notification Timeline: Why Rejection Letters Are Sent So Late? <sec:late-rejection>
// \sectioninfo{Grad programs often wait for accepted students to make their decisions, typically by \Gls{April15}, before sending out rejection letters.}

//%"Just reject me already!" is a common sentiment among applicants.  Indeed, school will first send out admission offers to the top candidates. They do not send out rejection letters because there is still a chance that some of the top candidates will decline the offer. If they do, then the school will go to the next set of candidates and send out offers to them.  This process continues until all spots are filled.  This is why you might not hear back until late in the admission cycle.



// % \begin{figure}
// %   \centering
// %     \includegraphics[scale=0.3]{files/waitlist.jpg}
// %     \caption{Email from the University of Rochester about sending offers and waitlist. <fig:waitlist}
// % \end{figure}


#figure(
  image("files/waitlist.jpg", width: 90%),
  caption: [Email from the University of Rochester about sending offers and waitlist.]
) <fig:waitlist>

Some schools send out admission letters in batches, some do #gls("rolling admission"), and some do not send anything out, e.g., because you're on their waitlist. You should hear back from most schools by mid-March, though rejection can come out much later.

Not much you can do other than to be patient and wait. Do not send emails asking about interviews or status; unless you have interviewed specifically with someone then you can ask that person for status updates and other questions (@sec:accept-postpone-decline).  You can, though not recommended, send an email to the CS dept to ask about your status, but likely they will not reply (in addition to being busy, they do not want to give you false hope or inaccurate information), or they can send a generic reply such as "we are still reviewing applications" or "you will hear in two weeks". @fig:waitlist shows an email from the University of Rochester about their admission process.

#paragraph[Acceptance Letters][ Universities often prioritize sending out acceptance letters first. This allows the admitted students to make decisions and plan for their studies. Read carefully on the acceptance letter for terms and conditions, e.g., funding and other benefits (@sec:offer-letters).

Some universities have #gls("rolling admission"). Others have a specific date when they send out the first round of acceptance letters.]

#paragraph[Response Deadlines][ Accepted students are usually given a deadline to make decisions on their offers, often around #gls("April 15", first: false). After this date, CS programs can gauge how many slots remain unfilled.]

#paragraph[Waitlist][Most CS programs have a limited number of slots for PhD students, and thus put many good students on a #gls("waitlist", first:true).  If accepted students decline the offer, then offers are sent to students on the waitlist. So if you see people getting accepted, that does not mean you are out yet. 

Also, do not feel embarrassed or discouraged if you are on the waitlist. Many students are on the waitlist, and there is a good chance that you will get an offer later.]

#paragraph[Rejection Letters][Schools typically start sending out rejection letters to remaining applicants _after they have finalized their admissions decisions_. Thus, rejection letters are often sent out late (e.g., after #gls("April 15") or even much later). 

Not much you can do here. You can try to contact the school to ask about your status, but they might not reply, they might say they are still reviewing applications, or give you inaccurate information (e.g., you will hear in two weeks). In short, you just have to be patient and wait, and also beware that some schools do not send out rejection letters at all.]

// % \section{Preparing and Tracking Applications}


// % \paragraph{Shared Spreadsheet} Many students use a (shared) spreadsheet, e.g., Google Sheets/Docs, to help them and their letter writers to keep track of their applications. Here are some information to put on the sheet.
// % \begin{itemize}
// %   \item \textbf{Your info}: Full name, email, phone, link to website/CV.  This is helpful for the writers just in case they want to quickly get some information about you.

// %   \item \textbf{Applications details}: University, Dept, Application System URL, Submission Deadlines, Application Status (e.g., submitted,  rejected, wait-listed, accepted)

// %   \item \textbf{LORs}: Writer 1, Writer 2, Writer 3.  If this is a shared document, you might want to omit names and just use writer X. Under each is their status, e.g., sent/not yet/reminder needed, etc.


// % \end{itemize}


// % You can then share this sheet with your reference writers and remind them to submit LORs on your behalf (see \autoref{chap:LOR}). Also, you should periodically update your writers with your status; a simple note such as \emph{"I am getting interviewed by prof. X at school Y. Do you have any advice?"} can get you a lot of help.


// % \paragraph{Communicating with LOR writers and People Who Support You}

// % stressfull time, rely on support from others
// % ask ppl to review your SOPs
// % provide information for LORs, ..
// %

#pagebreak()
== Getting Admitted <chap:accepted>
////#chapter-opener([Congrats! Now it is your turn to evaluate the school! Attend *Open House* to learn more about the place and *interview* profs---they would be much more willing to talk to you now.])

#simpsons[Oh... and how is education supposed to make me feel smarter? Besides, every time I learn something new, it pushes some old stuff out of my brain. Remember when I took that home wine-making course and I forgot how to drive?]

By around mid-March you should hear back from most PhD programs that want to admit you. 
But you likely won't hear back from schools that do not want to admit you (@sec:late-rejection), e.g., you're on their wait list.

If you receive offers, congratulations!  Now you're at a different game because the schools that have admitted you will try to get you to accept them!  Look carefully at the offer letters (@sec:offer-letters) for the terms and conditions of the offers.  Other important factors to consider include the reputation of schools (@chap:choosing-school) and professors (@chap:choosing-advisor), and funding availability (@chap:funding). You will have to make your decision (@sec:accept-postpone-decline) by a certain deadline, e.g., #gls("April 15").

#paragraph[Open House][Most schools have #Gls("open house") or _Visit Day_ events, which are a great resource to learn about the school, department, faculty, research, living, etc.

Even if you can't come in person, you should attend virtually and meet with individual faculty. During the event, you get a chance to learn more about the program, and talk to individual faculty and current students.  Take notes of faculty who make you excited, and count those taking in new students (if they meet you, likely they are considering new students!).  Talk to students about their advisors, the dept, the area, and the funding situation.  Ask about anything you want to determine that they deserve _you_.]

#note-block[
  GMU has _Virtual Open House (VOH)_, e.g., #link("https://cs-GMU.github.io/cs-phd-voh-s23/")[here]. We invite all admitted PhD students to the VOH through Zoom to learn about the CS program, the department, GMU, and the DC area in general. Students also get opportunities to chat with professors and current students.
]


#paragraph[What's next?][Make a decision, accept, reject, or defer the offers (a #gls("deferral", first:true); see @sec:accept-postpone-decline). Ask to meet with potential advisors (e.g., through #Gls("open house") or separately) and even their students. Ask about computer equipment and software, office space, and other resources; in many cases these will be provided for free by your advisor or department (@sec:buying-equipment).

Also, do not forget to update and thank LOR writers and others who have supported you through this process (@sec:thank-writers).
]


=== Checking Status, Accepting, Postponing, and Decline Offers <sec:accept-postpone-decline>

Students often ask about what to do after they get an interview or an offer from a professor, e.g., if they can follow up to find out about their status, or is it OK to postpone or accept/reject offers?, and most importantly, how to do so without offending anyone. 

#strong[Checking your application status and following up emails] If you have interviewed and not heard back from a professor after a few weeks or especially around the time when universities send out their admission decisions (around late Feb--mid-Mar), you can email to check.  You can follow up the interview invitation and say: 

#emph-block["Thanks for chatting with me. I am very excited about the opportunity to work with you.  Could you please let me know if you have made a decision or if you need more information from me?"] 

If you have new updates, e.g., new publications or new fellowship awards, or even new offers from other professors or schools, you can also mention that.

Profs. are often very busy (@sec:busy), especially during admission time when they have many reviews and interviews.  They might not have time to respond to every email.  If you do not hear back after a week, you can send another email to check again.  If you still do not hear back, you can assume that you are not selected.

#tip-block[You will get a higher chance about your status if you contact the professor you interviewed with or have a direct communication channel, rather than the CS department, which likely cannot give you any information about your status and might not even reply to your email.
]

#strong[Accepting an offer] If you decide to accept an offer, you can say: #emph["Thank you for the offer.  I would like to accept it and look forward to working with you.  Could you please send me more details about the offer and what to do next?"]. The prof. will likely send you more details about the offer and what to do next.  If you decide to accept an offer, do so quickly.

#strong[Postponing an offer] If you need more time to decide, you can ask for more time: #emph["Thank you for the offer.  I am very excited about it.  However, I am still waiting for other offers and need more time to decide.  Would it be possible to postpone the decision for a few weeks?"]. This is perfectly fine and professors will understand and might even appreciate your honesty.  They will likely give you a few weeks to decide.  If you need more time, you can ask for more time.  But do not ask for too much time, e.g., more than a month.  You also should not postpone the offer multiple times, which will annoy people.

#strong[Declining an offer] If you decide to decline or reject an offer, you can say: #emph["Thank you for the offer. However, I have decided to accept another offer.  I appreciate your time and consideration.  I hope we can work together in the future."] Professors will understand and wish you luck.  If you decide to reject an offer, do so quickly.

#caution-block[
  *Accepting an offer and later rejecting it*

  I've seen many students, especially international, face a dilemma when they #emph[commit] to a graduate offer but then receive another—potentially better—one. Advice given in online forums is often along the line that it's okay to switch, using reasons like you haven't yet had a strong relationship with the prof. or you should prioritize your personal benefit.

  In my opinion, these reasons are not strong enough to justify retracting an acceptance. A more valid reason is using the #gls("April 15") #link("https://cgsnet.org/wp-content/uploads/2024/01/CGS_April15_Resolution_Jan312024.pdf")[resolution], in which many universities participate. Among various things, this resolution states that students are free to accept a new offer from a different institution until 4/15, even if they have already accepted an offer elsewhere.

  However, in general, retracting an acceptance can have ethical implications. When you accept an offer, you are committing to work with that prof, who then might stop looking for other students. So by retracting your offer, you are breaking your commitment and also causing a great deal of inconvenience to the prof and also taking away the opportunity from other students. 
  Ultimately, this choice is personal and involves a balance between personal benefit and ethical considerations.
]

=== Offer Letters and Terms <sec:offer-letters>
// \sectioninfo{The offer letter is essentially an employment contract.  Make sure to read and understand the terms of the offer.}


#figure(
  image("files/admission-letter-started-with-saying-i-am-not-happy.jpeg", width: 70%),
  caption: [When you get an admission letter that starts with #emph["I am not happy to inform you..."] (#link("https://www.reddit.com/r/gradadmissions/comments/1bc7e2a/admission_letter_started_with_saying_i_am_not/")[Reddit]).],
) <fig:admission-letter-started-with-saying-i-am-not-happy>

Your admission notification will likely come with an offer letter (in some cases it might come separately).
This letter is essentially a contract between you and the school, and lists the terms of the offer, including #gls("stipend"), tuition waiver, health insurance, and other benefits. The letter often also has some conditions, e.g., maintaining a satisfactory academic performance, making progress in research, etc. 
You will need to sign and return the letter to accept the offer, e.g., by April 15--the deadline for many schools.

@fig:gra-offer shows an example of a GRA offer letter from GMU. It shows the 9-month stipend#footnote[Note RAs can get additional summer funding from their prof. (@sec:summer-funding), but this will not be shown in the offer letter as it is not guaranteed.], the funding source (i.e., the prof. who provided the RA), tuition waivers (9-credit, which is full time for grad student), and health insurance.

In contrast, @fig:gta-offer shows an example of a GTA offer letter from GMU. Unlike GRA offer, the GTA assignment does not specify the prof. who will supervise you, as TAs are typically assigned by the department. However, other benefits such as stipend, tuition waiver, and health insurance are similar to GRA offers.

It is #emph[unlikely] that you can negotiate things like the stipend, as it is standard across all students. However, you might ask your professor for computer equipment or other support (@sec:negotiate).

#note-block[
  You might receive "informal" offer from the prof., e.g., through email or verbally. This is typically as the profs. are excited to have you and want to give you important details such as stipend. You can "informally" accept the offer, but you will still need to sign the official offer letter to make it official.
]

#figure(
  image("files/gra_offer.pdf", width: 90%),
  caption: [An example of a GRA offer letter.],
) <fig:gra-offer>

#figure(
  image("files/gta_offer.pdf", width: 90%),
  caption: [An example of a GTA offer letter.],
) <fig:gta-offer>

// %\includepdf[pages=1]{files/gra_offer.pdf}

=== Negotiating PhD Offer (e.g., Having Multiple Offers)? <sec:negotiate>
// \sectioninfo{You will not be able to negotiate stipend, but you can ask for specific start date, TA assignment, and conference travel budget.}

In CS, negotiating a GTA stipend is unlikely, as it is determined by the university (@sec:ta). For RA (@sec:ra), advisors have more leeway as it is funded by their grants. However, they will likely not negotiate RA stipend as they have to be fair to other students and also have to follow departmental standards. Note that the university typically automatically increases these stipends each year by a small amount.

Typically, the most wiggle room is funding in the summer (@sec:summer-funding) where the prof. might be able to pay you more from their grants. However, they typically only do this after you have been with them for a year or so and they see your potential.

For a specific start date or GTA assignment (e.g., TA'ing a particular course), you can ask for it. Also, there is typically no moving allowance for PhD students. In short, standard things set by the university or department are unlikely negotiable. However, you can ask for things such as books and computer equipment (@sec:buying-equipment).

#caution-block[*My decision rule:* #highlight[Don't try to negotiate a standard TA/RA offer merely because career websites say you should negotiate everything.] You will likely not change a centrally determined stipend, and you risk signaling that you misunderstand how PhD funding works. Ask informed questions about summer support, equipment, start dates, and funding duration instead. Negotiation is normal for many jobs; it is not automatically useful in CS PhD admissions.]

=== Buying Computer Equipment <sec:buying-equipment>
//\sectioninfo{Ask your prof. if they can buy computer equipment and such for your research.}


Students understandably get excited about their upcoming PhD journey and want to buy new computer equipment and electronics to prepare. However, you should first check with your professor. They might have funding to buy you computers and other equipment (e.g., software, books, keyboards, headphones, tablets, etc). Many CS programs also provide budget or computer equipment—such as a laptop—to incoming PhD students.

However, do not assume that your prof. will automatically provide you a new laptop and other equipment. Check with them first. Some professors have grants or discretionary funds to do this, but it's not a guarantee. Some prefer that you have been with them for a while before they buy some powerful hardware.

Finally, keep in mind that these computers and equipment would be university property, which might be monitored and have certain restrictions, e.g., do not install illegal software on them (@sec:illegal-software). You will likely need to return them when you graduate.

=== Making the Most of Visit Days and Comparing Offers <sec:visit-days>

//#draftbanner(note: "Maybe add the GMU VOH link/photo again here, or cross-ref it. Could also add a small comparison-table figure showing how I'd weigh advisor vs money vs location.")

Congratulations---getting multiple offers is a wonderful problem to have. Now you have to _choose_, and this is one of the most consequential decisions of your PhD. Unlike the application stage, where the school evaluates you, this stage is the reverse: #highlight[you are evaluating them]. Most programs host an _open house_ or _visit day_ (in person or virtual) precisely to help you decide, and you should take full advantage of it.

#paragraph[Talk to the right people][At a visit day, faculty will (naturally) present their program in the best light. The most honest signal comes from _current students_, especially those of the advisor you are considering. Try to talk to them _without_ the advisor in the room. Good questions to ask students:
- Are you happy? Would you choose this advisor again?
- How often do you meet with your advisor, and what is their style (@chap:choosing-advisor)?
- Is funding stable (@chap:funding), or do you worry about it year to year?
- How long do students take to graduate (@sec:time), and where do they end up?
- Has anyone left the group, and do you know why?
]

#paragraph[What to weigh][There is no universal formula, but for a PhD the rough priority order is usually:
+ *Advisor fit* (@chap:choosing-advisor)---by far the most important. A great advisor at a "lower-ranked" school often beats a hands-off advisor at a famous one (@sec:selecting-ranking-schools).
+ *Research match*---are there at least two faculty you would be excited to work with? (Advisors leave, run out of funding, or turn out not to fit; a backup matters.)
+ *Funding stability and stipend* relative to local cost of living (@sec:ra-cost, @chap:practical-finances).
+ *Placement*---where do graduates from this group actually go?
+ *Location and life*---climate, community, partner/family considerations (@chap:visa). A PhD is long; being miserable where you live makes it harder.
]

#tip-block[Now that you are admitted, professors are _much_ more willing to talk to you than they were before you applied (@sec:busy). Email the faculty you are interested in and ask for a one-on-one chat about their advising style (@chap:choosing-advisor), expectations, and current funding. Ask to be connected with their students. This is also the moment, if you have competing offers, to (politely) negotiate (@sec:negotiate).]

#caution-block[Do not pick a school purely on its ranking (@chap:rankings) or its name. The day-to-day reality of a PhD is shaped by your advisor and your group, not by the logo on your degree. Rankings are a starting filter, not a decision rule.]

== Dealing with Rejection <chap:not-accepted>
//#chapter-opener([Rejection is part of academia. Common reasons for rejection include aiming too high, not a good fit, and bad luck. Do not take rejection personally. Learn from it and try again.])

#simpsons[You tried your best and you failed miserably. The lesson is: never try.]

Rejection is a common part of the PhD application process. In fact, rejection is part of academia (e.g., you _will_ get rejected for papers, grants, jobs, etc). Don't take rejection personally and learn from it.

=== Try Again! <sec:try-again>

If you do not get admitted to any schools or don't want to go to the ones that admit you, try again next year! Grad admission can involve randomness and noise. In the meantime, you can work on improving your profile, e.g., get more research experiences, publish more papers, improve your connections for stronger LORs, etc. See rejection reasons (@sec:why-rejected) and additional advice to improve your chance (@sec:stand-out).

#example-box[
  I got rejected from 12/13 CS PhD programs in 2007. While I believe I have strong research profile with multiple publications, I did not know much about the admission process and made many mistakes. But in any case, I did get into one school: the University of New Mexico (UNM). I decided to just take UNM instead of waiting for another year. I felt that was the best decision at that time (and in retrospect, it made me who I am today).
  
  If you didn't get into your top choices but into some other schools, you can do what I did and just take it---and do really well there. You can also try again next year or go to a different school.
]

You can consider applying to MS programs, which are typically easier to get in; but you likely need to pay (@sec:ms-admission). A university that rejected you for PhD might accept you for MS. If you get into an MS program at a school of your choice, you can contact professors to work with them. If you do well, you can ask the professor to support you to convert to PhD. You will likely need to apply again, but you will have a much better chance because you have the direct support of a professor there.

#strong[Should I ask for feedback?]
No, don't bother. You will likely not get any useful feedback. We are not willing (sometimes not allowed) to reveal your evaluation results or give you feedback on how to improve your profile. So just move on. If you really want advice, ask your professors, collaborators, ref writers, or those who have previously applied.


=== Why Did You Get Rejected? <sec:why-rejected>
// \subsectioninfo{You aim too high, are overqualified, or even because you applied to AI/ML, a super competitive field in recent years with many applicants.}

Many students lament that they get no interviews or are rejected and that the admission process seems random. However, while it is true that the process can involve some luck and randomness, it is not completely random. There are many reasons why you might get rejected, e.g., your profile is *not* as strong as you *think* it is (@sec:profile-not-strong). Even if your profile is strong, you still can get rejected, e.g., aiming too high (@sec:chance-me), not a good fit, overqualified, having red flags, etc.

==== Your Profile Is *Not* as Strong as You Think <sec:profile-not-strong>
I have seen many cases where students think they have a strong profile, but they do not. Here are some common examples:

Your #strong[LORs] (@chap:LOR) might not be as strong as you think. Your reference writers—who might be very well-known within your institution—might not be well-known internationally, or they might not be very active in research, or may not know how to write a strong letter.

Your #strong[School] (@chap:your-school) might not be as good as you think. It might be the "top" in your country (or in your own definition), but we do not know about it. For example, most well-known schools in Vietnam are not well-known outside of Vietnam.

Your #strong[Research] (@chap:research-experience) might not be as strong as you think. Participating in a research project does not mean much (or anything) without results, e.g., publications (@sec:publications). Moreover, publications might not have much value if they were published locally or in unknown venues. Even papers at top venues might not be as impressive as you think. For example, many AI/ML/NLP faculty are not interested in "dataset" work, even if papers appear at top venues like NeurIPS (@fig:comment-neurips). //However, while you might not have papers, you might get strong LORs from professors or PhD students you worked with closely on research projects. But just saying you do research is not enough.



#figure(
  caption: [Comment from an NLP researcher on an applicant with multiple NeurIPS papers.],
  align(left)[
    #text(size: 0.9em)[
      #emph-block[_"The applicant has done some interesting work, but much of what they have done has been only on dataset creation, with almost nothing on actual modeling or tackling tasks. This has merits, but it's more of an engineering feat than a research feat."_]
    ]]  
) <fig:comment-neurips>



==== Other Common Reasons for Rejection
Even with a strong profile (e.g., research potential, GPA, LORs, SOP, interviews), you can still get rejected for various reasons:

#strong[You aim too high.]
You have applied to schools that are way too high for your profile (@sec:profile-not-strong and @sec:selecting-ranking-schools). Many students apply only to top 10 CS programs and are surprised when rejected from all of them, sometimes multiple years in a row. While ambition is valuable, understand how PhD admission works (e.g., good GPA or GRE scores matter less at top programs), recognize that the US has many excellent schools (@sec:chance-me), and be realistic about your targets.

#strong[Not a good fit and bad luck.]
You could have an excellent profile, but if your research interests don't align with the program's strengths, you won't be admitted. Similarly, if no faculty can advise you—due to sabbatical, insufficient funding, or already having many students—you'll be rejected (this is actually good; you don't want to be somewhere without proper guidance).

Bad timing also plays a role. For instance, since 2024, there's been a surge in AI/NLP applicants (thanks, ChatGPT!). Overwhelmed AI/NLP faculty may reject strong candidates simply due to capacity.

#tip-block[
Before applying, ask your professors and LOR writers for honest feedback on where you should target. Apply to a range of schools, including "safety" options.
]

#strong[Lack of interest or overqualification.]
You can be rejected for insufficient interest in the program. Beyond a generic SOP (@sec:kiss-of-death-sop), this includes ignoring professors' interview invitations or showing little knowledge or enthusiasm during interviews.

Paradoxically, overqualification is also a reason. If adcom believes you'll get into a better program, they may reject you to save the spot for someone else.

#strong[Low GPA or exam scores.]
While faculty may not emphasize these, universities often set minimums you must pass. For example, minimum English proficiency is often required for GTA funding---low scores raise concerns about your ability to communicate with students. Faculty may be reluctant to argue against institutional requirements.

#strong[Red flags.]
Various issues can raise concerns: many STEM courses with low grades or withdrawals, plagiarism, cheating, or other academic dishonesty. A history of jumping between programs is another flag—adcom members may have contacts elsewhere. If these apply to you, address them in your SOP or ask your letter writers to do so.

==== "Chance me" on Getting into T10 Programs <sec:chance-me>

Many international students aim for very top schools such as Stanford and MIT, and #link("https://en.wikipedia.org/wiki/Ivy_League")[Ivy League schools]. Every year #link("https://www.reddit.com/r/gradadmissions/")[Reddit] and other forums have numerous students asking for evaluation of their chances of getting into these schools (the so-called #emph["chance me"] or #emph["roast my CV/profile"] posts) and then later posts on being #emph["ghosted and rejected everywhere"]. Here's my take on this (adapted from my #link("https://www.reddit.com/r/gradadmissions/comments/1fogyg5/reality_check_for_aspiring_phd_applicants_youre/")[post on Reddit]):

#caution-block[*Unpopular opinion:* There is no true "safety" PhD program. A less famous department may still reject you because nobody works in your area, the relevant professor has no capacity, or the TA budget was cut (@sec:how-decisions). Build a balanced list, but do not confuse lower ranking with guaranteed admission.]

#strong[You are unlikely to get in these schools.] While being ambitious is good, you also need to be realistic, and the harsh reality is that it is very unlikely that you will get into MIT or Harvard unless you are very exceptional (in which case you would not be asking about your chances on Reddit).

#note-block[PhD programs rarely publish admission numbers, but the scale is sobering: university-wide PhD admit rates at places like #link("https://irds.stanford.edu/data-findings/doctoral-admissions")[Stanford run around 5--7%], and the most selective CS programs admit an even _smaller_ slice---often low single digits---out of thousands of applicants (and usually those applicants are already very strong). So you should also apply to the many excellent programs below the "household names" (@sec:selecting-ranking-schools).]

#figure(
  image("files/xkcd_survivorship_bias.png", width: 35%),
  caption: [The "chance me" posts you read are survivorship bias in action: you mostly hear from the few who got in, not the many who did not. Source: #link("https://xkcd.com/1827/")[xkcd 1827], #link("https://creativecommons.org/licenses/by-nc/2.5/")[CC BY-NC 2.5].],
) <fig:survivorship>

People who do get into these schools often were explicitly encouraged by their mentors and LOR writers, who themselves might be alumni of these schools or are academic celebrities who've sent many of their students there. If you are not in this category (doubt you are, because you're asking random people on the internet instead of your trusted LOR writers), then you're likely not going to get in, and MIT and Stanford would gladly take your application money.

#strong["Your" top might not really be top in CS.] Harvard and the Ivies? Yes, good for many things but usually not coding marathons and typically absent from top CS conferences. (Okay, they are still good, but a school somewhere in Maryland, Wisconsin, or the Urbana-Champaign cornfield would likely beat them by far in CS). MIT and Stanford? Yes, they are top, but many others are equivalent, and there are many CS areas (@sec:csrankings) where they are not as strong as other schools. Caltech and Johns Hopkins? Are you confusing CS with Physics and Medicine?

You're missing out on some serious CS PhD programs: UCSD, UW, UMD, Michigan, Purdue, Stony Brook. These all have strong CS programs but rarely get mentioned compared to the usual suspects. Utah, Rutgers, Buffalo, Penn State, UVA, Ohio, UC Riverside, GMU—any of them ring a bell? These might not rank very high on QS or US News and are not household names to you, your friends, or your parents, but they are excellent CS schools where graduating students from your dream schools often apply for faculty positions (e.g., see #link("https://realgmucs.github.io/stats")[GMU stats]). You can go to these places and be a superstar there—be the big fish in a small pond, instead of a small fish in a big pond.

#strong[You don't need to be top.] Top schools will open doors to more opportunities. In countries like Vietnam, there are few top schools, and if you don't get into them, you are doomed (or so you think). But that is not the case in the US. There are many good schools, and it is not a binary choice between top X or nothing. In fact, equity is emphasized in the US and "smaller" schools are often given more resources and attention to help students succeed.  

#tip-block[
  Don't aim for just the moon and the stars; also try the sky, clouds, or even just the trees. You might find much happiness and success there, which can then catapult you places beyond the moon and the stars. This is the American dream, which is strongly embodied in its higher education system.
]

#caution-block[
Note that what I said above might not apply to BS or even MS degrees, which often do not involve research and thus are more about the school name and your grades. For PhD, it is all about the research.
]

=== Standing Out: Increasing your admission chance <sec:stand-out>
// \subsectioninfo{You can improve your profile by being unique and standing out.}

#figure(
  image("files/alpinist-climbing-peak-mountain-comic-hand-drawn-vector-illustration.jpg", width: 50%),
  caption: [Standing out (@sec:stand-out) often comes down to persistence and grit---like summiting a peak---not just a polished profile.],
) <fig:alpinist>

Given the high number of quality applicants and a limited number of spots, in addition to having a good application profile, you want to show something that makes you #highlight[stand out]. For example, even if you do not have research experience, you can talk about your personal projects, as long as they show you can do research. If you have an open-source project (@sec:open-source-contribs) that has lots of stars on GitHub, mention it. If you often write technical, research-like blogs with many viewers, talk about them too.

There are other things you might not think are important but can make you stand out. For example, if you have a strong background in a non-CS field that can be integrated with CS, e.g., you have a degree or background in _dance_ or _music_ and want to integrate them with CS, do talk about it. If you have reported numerous bugs in Knuth's The Art of Computer Programming and received several reward checks from Knuth himself, mention them---this shows exceptional attention to detail and a good understanding of algorithms.

#example-box[
  In #link("https://matt.might.net/articles/how-to-apply-and-get-in-to-graduate-school-in-science-mathematics-engineering-or-computer-science/")[his post], Matt Might was initially unsure about an application. However, upon learning that the applicant had led a *100km hike in the Himalayas*, he decided to accept the applicant. This is a good example of _standing out_, and I would also advocate for such student as this shows they have the persistence and determination required for research.
]

== Advice for Specific Applicant Profiles <chap:profiles>

//#draftbanner(note: "Add more profiles if I think of them (e.g., career-switchers from a totally different discipline, military veterans). Keep the tone encouraging---these applicants often count themselves out unnecessarily.")

Much of this book describes the "typical" applicant: a student applying straight out of (or shortly after) an undergraduate or MS program. But many strong applicants do not fit that mold, and they often count themselves out for the wrong reasons when in fact they can leverage their unique experiences to make a compelling case, i.e., stand out (@sec:stand-out).


=== Non-Traditional and Returning Applicants <sec:non-traditional>

If you have been working in industry for several years, are older than the typical applicant, or are switching careers, you may worry that adcoms (@sec:adcom) will see you as a poor fit and not as competitive as younger applicants.
However, in my experience, #highlight[work experience can be a real asset], as long as you connect it to research.

#paragraph[Experience][Industry experience shows you can ship real systems, work on a team, and _persevere_ through hard problems---all things that matter in research. If your work involved anything research-adjacent (building ML models, analyzing systems, or contributing to open-source projects; @sec:open-source-contribs), highlight it in your application.

If you have a publication or two, even better. The writing doesn't have to be in a top venue, technical reports or white papers or just technical blog posts are sufficient to show you can communicate your work.]



#tip-block[In the era of AI and LLMs, younger applicants is not always better as many of them just throw things into Claud and don't understand the underlying systems. Prof. are well aware of that and have the fatigue of dealing with such students. So, ironically, modern technological advances have made older applicants more competitive than before: we need people who can understand the underlying systems and can grind through hard problems instead of just burning token credits on LLMs.
]

#paragraph[Challenges to address][The two real challenges are (1) *letters of recommendation* (@chap:LOR)---you may no longer be in touch with professors---and (2) *demonstrating research interest*, since industry work is not the same as research.

For letters, a manager or senior engineer who can speak concretely to your technical ability and initiative is fine, ideally alongside at least one academic letter if you can get one (or at least someone who has a PhD and actively does research).

For research interest, use your SOP to explain _why_ you are leaving a (presumably well-paid) job to do a PhD---a thoughtful answer here is compelling precisely because the opportunity cost is real (@sec:worth-it).]

#tip-block[If it has been a while since you did anything academic, consider getting a small amount of recent research exposure first---a side collaboration, an open-source contribution (@sec:open-source-contribs), or a virtual research program (@chap:research-opportunities). It refreshes your skills, gives you a recent academic letter, and signals that your interest is genuine and current.]

=== Applicants with a Weak Academic Record <sec:academic-recovery>

A low GPA, a failed course, or a degree from a less-known school (@chap:your-school) is not the end of your chances.

#paragraph[What actually moves the needle][In rough order of impact:
- *Research experience and publications* (@chap:research-experience)---the single strongest counterweight to a weak transcript.
- *Strong, specific letters* (@chap:LOR) from people who can vouch for your research ability.
//- *An upward trend*---if your later grades, especially in CS and Math, are strong, that matters more than a rough start.
- *Additional Evidence of standing out* (@sec:stand-out)---projects, competitions (@sec:competitions), open-source work.
]

#paragraph[Addressing it directly][If there is a clear explanation for a bad patch (illness, family circumstances, a rough adjustment year), you can briefly and factually mention it in your SOP. State what happened, what you learned, and what you did afterward (preferably, your grades should show an upward trend). Then move on to your strengths. Do _not_ make excuses or spend half your essay on it.]

#caution-block[Be aware that grades _below a hard cutoff_ in relevant courses (Math, CS) can read as a #alert[red flag] (@sec:why-rejected), and some programs have minimum GPA requirements for funding. If you are near a cutoff, it is even more important that the rest of your application gives the committee a reason to advocate for you.]

//#remark-block[Plenty of successful researchers, myself included, did not have a flawless record. Adcoms know that grades measure coursework, not research potential, and the two are only loosely related (@sec:profile-not-strong). Tell a story of growth and back it with evidence, and a weak transcript becomes a footnote rather than a verdict.]

#pagebreak()

= Funding <chap:funding>

//#chapter-opener([TAs, RAs, and fellowships are main funding sources for PhDs. TAs are provided by the department to help with classes. RAs are given by profs. to help with their research. Fellowships, provided by the university, department, or external sources such as government or industry, give more flexibility but can be very competitive.])

#simpsons[Bart, with \$10,000, we'd be millionaires! We could buy all kinds of useful things like ... love!]

If you're admitted to a #emph[good] CS PhD program, you should not have to worry about funding!
In the US, the common types of funding for PhDs are #emph[graduate teaching assistant] (GTA or TA), #emph[graduate research assistant] (GRA or RA), and #emph[fellowship].
GRA is paid by a prof. for you to do their research. GTA is paid by the dept. for you to help with teaching. Finally, fellowship is independent funding that can come from a school, a company, or an organization. 

#caution-block[*What faculty will not tell you:* Funding is not merely a benefit added after admission; it often determines admission. A department with fewer TA lines must admit fewer students. A professor with a new grant may suddenly recruit several students, while the same professor may recruit nobody after a proposal is rejected. This is why a strong applicant can be rejected one year and welcomed the next without becoming a different person (@sec:how-decisions).]

@tab:funding summarizes the differences.
Note that funding is typically more available for PhD students than MS (@sec:ms-funding).

#figure(
  caption: [Different types of PhD funding. All cover tuition, insurance, and stipend.],  
  text(size: 0.9em,
  table(
    columns: 4,
    align: left,
    stroke: none,
    table.header(
      [], [*TA*], [*RA*], [*Fellowship*],
    ),
    table.hline(),
    [*From*], [School], [Profs.], [School/External],
    [*For*], [Teaching Assist.], [Research], [Research],
    [*Cover All?*], [Yes], [Yes], [Yes],
    [*Summer?*], [No], [Maybe], [Likely],
    table.hline(),
    [*Pros*], [Research Freedom], [Get to do research], [Research Freedom],
    [*Cons*], [Teaching Duties], [Research Restriction], [Competitive, Limited],
  ))
) <tab:funding>

== Graduate Assistantship (GTA/GRA) <sec:ta-ra>

#definition-box[Graduate Assistantship][A graduate #gls("assistantship") is a funded position that comes in two main forms: #gls("TA", first:true) and #gls("RA", first:true). Both typically include a *tuition waiver* (so you don't pay tuition), *health insurance* (which is required in the US), and a #gls("stipend") (your salary).]

The graduate assistantship is the most common type of PhD funding. Some universities also offer discounts or insurance coverage for spouses and children.

A few notes about stipends:
- The stipend amount *varies* by location (e.g., higher in expensive areas like DC than in Lincoln, Nebraska), university, and sometimes by department.
- An #gls("AY", first:true) is usually *9 months* in the US, so the standard stipend covers 9 months. Summer funding (@sec:summer-funding) may be available from your professor or a fellowship, but TA positions are rarely available in summer.
- Like most income in the US, you *must pay tax* on your stipend.
- Private universities may offer higher stipends, but sometimes have extra or hidden fees (such as per-credit fees or activity fees).

#note-block[
  At GMU, both GTA and GRA positions provide similar benefits: tuition waiver and health insurance. The college and department set the standard 9-month stipend for graduate assistants. GTA positions (paid by the department) usually pay this standard rate, while GRA positions (paid by professors) may pay more, especially for advanced students (e.g., those close to graduation, or ABD#footnote[ABD: all but dissertation.]).
  
  In GMU's CS department, GTA/GRA stipends are among the highest: CS is part of the College of Engineering and Computing (CEC), which already pays more than other colleges, and CS itself pays above the CEC baseline. It's also common for CS faculty to pay their RAs more than the standard TA rate.
  
  Health insurance is required at most US universities. Don't assume you can skip it because you're young and healthy (@chap:cultural-misc). At GMU and most CS PhD programs, your GTA or GRA position includes full insurance. At GMU, your spouse and children can also get insurance at a significant discount. So you don't have to worry about health coverage for yourself or your family.
]


=== Teaching Assistant (TA) <sec:ta>

TA is common at the beginning of a PhD, when you have not yet found an advisor who can support you as  a GRA. It is also common to alternate between TA and RA, for example when your professor does not have enough funding or when you want to gain teaching experience.

#definition-box[Graduate Teaching Assistant or GTA][
As a GTA, you are paid through the school or department to help with teaching. You typically work up to 20 hours per week and assist with classes, for example by grading, running labs, or leading recitations.
During a semester, a GTA might work with several courses and professors, not necessarily their advisor. GTA funding is *not* typically available during the summer (@sec:summer-funding), when there are fewer courses.
]

*How to get GTA?* Unless you have other funding such as GRA or fellowships, GTA is typically the default funding source for CS PhD programs. In your application, simply indicate that you need financial assistance. Typically, adcom will either admit you with GTA support or reject you. We do not admit students without supporting them (@sec:ievaluate).

GTA assignments are decided by the department, so you usually do not need to worry about them. However, if you have a strong preference for a specific course or professor, you can mention that after being offered a GTA. This can let you work with a professor you like or in an area that interests you. In many cases, professors can request specific GTAs for their courses, for example students who have previously taken the course and done well.



#note-block[
  At GMU CS, admitted PhD students have 4 years of GTA guaranteed, and also receive a stipend for the first summer (@sec:summer-funding).
]

Even if you have other funding and do not need a GTA, you should still try GTA at least once. This lets you see what teaching is like, which is especially helpful for a research career where you often give talks and explain your work to others. GMU sometimes has courses that more senior students can teach. In that case, you may be paid as a GTA or sometimes even as a lecturer. This is a good opportunity to gain teaching experience, and you might even get paid a bit more.

*Where does GTA funding come from?* Typically, the department receives GTA funding from the college based on enrollment and budget, and then assigns GTAs to courses based on instructional needs and student qualifications. For example, a CS department often has many GTAs because it has high enrollment and many courses. In contrast, a department such as Math might have fewer GTAs because it has lower enrollment and fewer courses.

=== Research Assistant (GRA) <sec:ra>

#definition-box[Research Assistant or GRA][
GRA support is provided by a professor through their funding so that you can work on their research project.
As a GRA, you generally do not need to teach, so you can focus on research. Depending on the professor, GRA support may also be available during the summer. See @sec:ra-cost for more details on GRA budgeting.
]

*How to get GRA?* When a professor recruits you, they might offer you a GRA immediately, so you start the program with GRA support. However, a more common scenario is that you first get admitted with GTA support, then after a year or two you find an advisor who can support you as a GRA.

It is important to note that GRA support is *never guaranteed* because it depends on the professor's funding situation. So you should also pay attention to GTA availability, since GTA is a good backup plan and usually comes with benefits similar to GRA. In other words, you should check whether GTA support is readily available for PhD students in the program.


#note-block[
  If you got recruited and offered  a GRA by a prof., you will likely get admitted. For example, if a prof., even if not in PhD adcom, wants to fund you, adcom will likely respect that decision and admit you.
]


*Where does GRA funding come from?* Professors apply for funding to support students from various sources, such as government grants (for example NSF, NIH, or DoD), industry grants (for example Google or Microsoft), or internal university funds. For many CS professors, the most common source is #gls("NSF") grants, which are often designed to support graduate students as GRAs. Recently hired professors, such as new assistant professors, often also have start-up funds from the university to help them establish their research lab. NSF awards are public record, so before reaching out you can get a rough sense of whether a prof. or department has active funding, e.g., via #link("https://cspicks.roars.dev")[CSPicks]'s NSF funding search.

Typically, each grant can support one or at most two students per year, and each student can cost up to about \$70,000 per year (@sec:ra-cost). This is why professors often need multiple grants to support multiple students. It is also one reason professors may not have time to do experiments or write papers directly, and instead mentor their students to do that work. If a professor no longer has funding—which is quite common—they might not be able to support you as a GRA, in which case you would become a GTA while still working with the same professor.

== Fellowships/Scholarships <sec:fellowships>

#definition-box[Fellowship][Fellowship is another type of funding that students can get from the university, industries, or government.
Fellowships are typically competitive and generous, giving pretty much all benefits tuition/insurance that a GTA/GRA has.  They might even give higher stipends (including summer) and open doors for job opportunities such as internships.
]

#paragraph[How to get Fellowship?][Many schools provide fellowships to attract students. You likely will not need to do anything and adcom will recommend such fellowships to strong students. Some schools automatically offer a fellowship to all accepted students, while others only award it to a limited number of admitted students, such as the top percentile.]

If you're aiming for external fellowships (@chap:fellowships)---whether from the U.S. government like #gls("GRFP", display: "NSF GRFP") or #gls("NDSEG", display: "DOD NDSEG") or from major tech companies like Google, Microsoft, and Facebook---you'll need to apply on your own.
Such major fellowships typically require a clear and good research plan (the GRFP also requires broader impacts discussion). So it might be a good idea to wait until your second year to have research experience and even publication before applying. Remember, you're competing with the top PhD students at top universities worldwide.

#note-block[
  PhD applicants at GMU are automatically eligible for a *Presidential Fellowship*.  It is at least as good as GTA but the most important thing is that as a fellowship it is truly free money (i.e., you do not depend on any prof. or TA).  Adcom members nominate applicants for this fellowship and the whole committee will decide.
]

// In addition to general fellowships that are available to all students, there are also specific fellowships, e.g., for US citizens and permanent residents (@chap:domestic-students), for underrepresented minority (URM) students (@sec:urm), and students from specific countries. There are many fellowships available, so you should look for them and apply.

In general, external fellowships are highly competitive and prestigious---you will stand out if you get one.  Every PhD student has pubs, but only a few would have the NSF GRFP#footnote[#link("https://www.alexhunterlang.com/nsf-fellowship")[This link] is a good starting place for the GRFP with lots of proposal examples.] or Microsoft fellowships. In fact, these are so prestigious that even if you didn't get it but make it to the final round or even _"honorable mentioning"_ you should put it on your CV. @chap:fellowships discusses the evaluation processes of the #gls("GRFP") and #gls("NDSEG").

== Funding Misc.


=== Funding in the Summer <sec:summer-funding>

Students often get confused about summer funding, e.g., if they will get paid during the summer.  This is a good question because PhD students have no classes over the summer and so are often more productive and produce good research. However, summer salary is largely depending on your funding source.

First, recall that an #gls("AY")---consisting of Fall and Spring semesters---is typically 9 months. Thus, your stipend is for 9 months and do not cover the three summer months (many places allow you to #emph[spread] it over 12 months, so you get paid monthly over 12 months, but the total amount is still the same).

If your funding source is GTA (@sec:ta), you typically do not get paid over the summer because there are no classes to teach.  Some CS departments offer summer funding, but it is not guaranteed and might not be a lot. For example, at GMU, we offer summer funding for 1st-year PhD TA students. The amount over the 3-month summer is similar to their monthly stipend (i.e., their 9-month stipend divided by 3 for the 3 summer months).

For GRA (@sec:ra), your summer funding depends on your prof. and their funding.
When writing grant proposals, profs. typically include summer funding for their students (@sec:ra-cost). However, funding is never guaranteed, e.g., the prof might not get the grant.

#example-box[
For my students, I have been fortunate to have funding to support them over the summer. Over the 3-summer months, I typically pay them 1/3 of their 9-month stipend. I prioritize summer funding for my students because GMU has good GTA resources so they don't have to worry about funding during the AY.
]

Finally, for fellowships (@sec:fellowships) you might get paid over the summer depending on your fellowship (@sec:fellowships). Major ones, e.g., from NSF, Google, and Microsoft, will pay you the whole year.

=== Low Stipend? <sec:low-stipend>

Students might think their stipend is too low and not enough to live on.  For example, if you look at the stipend at GMU, which is around \$40K (including summer), and then compare it to the #link("https://www.epi.org/resources/budget/")[living cost] of Fairfax, VA, which says you need \$75K _annually_ to live in a 1-bed apartment, then you might be in a panic.

Whether a stipend is enough depends on local housing costs and your circumstances. You might not be able to live in a one-bedroom apartment by yourself, but sharing an apartment or house with other students can substantially reduce your expenses. You might not be able to buy a new car, but you could get a reliable used one or use public transportation where it is available. In short, a stipend that looks low relative to a general-purpose living-cost estimate may be workable with different housing and transportation choices.

In some cases, it might even be enough to support a spouse and children, though this depends heavily on rent, healthcare, childcare, and the family's circumstances. Many CS PhD students have their families with them; for example, one of my students supports his wife and child on his stipend. A good school knows that its funding package must be competitive to attract students. At GMU, for example, we try each year to improve the benefits, especially the stipend, for our graduate students.

For a full breakdown of how much a graduate student costs, see @sec:ra-cost.


#tip-block[There are websites such as #link("http://www.phdstipends.com/results")[phdstipends.com] and #link("https://csstipendrankings.org/")[CS Stipend Rankings], where students report their stipends. You can use them to get an idea of how much you can expect to be paid. Treat their living-cost comparisons cautiously, however: a general household budget may assume a lifestyle or household composition that does not match yours. For example, directly comparing GMU's roughly \$40K stipend with a \$75K Fairfax living-cost estimate suggests a \$35K annual deficit, but that comparison does not account for common graduate-student choices such as shared housing. Use the figures as a starting point and make your own budget based on rent, transportation, dependents, and other actual expenses.
]

=== How Much Do YOU Cost? <sec:ra-cost>
// \subsectioninfo{Your entire PhD program costs about \$400K in total, but you \emph{do not} pay for it.}

PhD students might wonder why their #gls("stipend") is low compared to the large grants their advisors get. They also wonder why their offer letters sometimes show that their benefits are higher than what they receive as stipend (e.g., your financial assistance says you get a package of \$60K, but your stipend is only \$30K).  The reason is that the cost of supporting a PhD student is much higher than just their stipend.  In fact, the total cost of supporting a PhD student can be around \$70K per year, which includes not only the stipend but also tuition, health insurance, and other expenses. Over the course of a 5-6 year PhD program, this can add up to around \$400K.

// #draftbanner(note: "This image (files/c6.png) is the SAME LOR comic used at the start of @chap:LOR (fig:lor-comic), and it looks misplaced here in the cost section---it has nothing to do with PhD cost. May be I mean a different cartoon?")

#figure(
  caption: [GRA cost breakdown. F & A is Facilities & Administrative Cost Base and MTDC is Modified Total Direct Cost. These are things that the university can charge overhead to.],
  text(size: 0.9em,
  table(
    columns: 3,
    align: left,
    stroke: none,
    table.header(
      [*Budget*], [*Cost \$*], [*Notes*],
    ),
    table.hline(),
    [GRA (9-month)], [30K], [],
    [GRA (summer)], [10K], [3-month, 20hrs/week],
    table.hline(),
    [*Total Salary*], [*40K*], [],
    table.hline(),
    [Health Insurance], [3K], [full year],
    [Tuition (In-State)], [15K], [(\$680/ Credit + \$150/Student Fee/ Credit)\* 9 credits = \$7470 (\$6120 + \$1350) per semester],
    [*Total Tuition & Insurance*], [*18K*], [Full year tuition + insurance],
    table.hline(),
    [Conference Registration], [500], [],
    [International Travel], [1800], [],
    [Domestic Travel], [700], [],
    [*Total Travel*], [*3K*], [],
    table.hline(),
    [Total Direct Cost], [*61K*], [Salary + Travel + Health + Tuition],
    [F & A (MTDC)], [21K], [Direct Cost - GRA Salary],
    [Total Indirect Cost], [*12K*], [58.9% of MTDC],
    [*Total (Direct + Indirect)*], [*73K*], [Budget for a GRA],
  )),
) <tab:cost>

@tab:cost shows the budget breakdown for a GRA per year.
These numbers are based on my experience at public universities in the US. Private universities may have different numbers.  For simplicity, I will assume the department has a 9-month stipend of \$30K and a 3-month summer of \$10K (a third of the 9-month stipend). I will also use GMU tuition rate of about \$15K/year for full-time study (which is quite cheap compared to private universities, e.g., Univ. of Chicago is a whooping \$70K) and a 58.9% rate on *indirect cost*, which is a typical rate charged for overhead or administrative costs (yes, after all, universities are businesses!).  Finally, I assume the students take two conference trips per year, one domestic and one international (conf. registration, airline tickets, taxi, meals, etc are all included).

In the end, the total budget comes out to be \$73K/year to support a PhD student. The summary is that #highlight[over your 5--6 years of your PhD, you cost about \$400K], and while your stipend is X, your advisor probably pays 2X for you. But of course, the nicest thing is that you do not have to pay for any of this! You get to gain the knowledge, do research, travel, and also get paid!


#pagebreak()
= Schools and Profs. <part:schools-profs>


== Choosing Schools <chap:choosing-school>
//#chapter-opener([Not every university has a CS PhD program. Not every professor, even those in CS, can advise or graduate CS PhD students.])

#simpsons[It's not the school you go to, it's what you do while you're there!]
// %\myepigraphsimpsons{"The answer to life's problems aren't at the bottom of a bottle. Heh heh! They're on TV!"}

Choosing a school and an advisor (@chap:choosing-advisor) is among the most consequential decisions in the process, yet much of the standard advice is useless: _"choose the place that feels right," "follow your passion,"_ or _"ranking does not matter."_ Applicants who have never visited the US, worked with these professors, or seen the departments cannot reliably act on that advice. This chapter gives you cruder but more actionable rules and explains where they can fail.

// % \section{Choosing a University <sec:choosing-university}
// % \sectioninfo{Select schools based on their CS program and faculty research interests.}

// We will first discuss universities in the US that offer PhD in CS. Then we will talk about how to select them.

=== Schools offering PhD in CS <sec:schools-offering-phd>

Most US universities have CS programs, but many _do not_ have a _CS PhD_ program. These universities might offer just Bachelor's degrees (e.g., BS) with no graduate studies (no MS or PhD), or only MS programs (but no PhD). For example, Penn State University Park has a PhD in CS, but Penn State Harrisburg offers only BS and MS in CS, and Penn State York offers only BS in CS. Conversely, multiple University of Texas locations—Austin, Dallas, and Arlington—all have PhDs in CS.

Thus, if your goal is a PhD in CS, you must target only schools offering such a degree. While the large number of US universities can be confusing, a little research on each school's website will clarify what degrees are available. Schools listed in @chap:rankings all have PhD programs in CS, so you can start there.

#note-block[There are _far_ more options than the dozen or so "famous" names. The #link("https://datavisualization.cra.org/TaulbeeSurvey/CRA_Taulbee_Survey_Report_2024.html")[2024 CRA Taulbee Survey] tracks over *300 PhD-granting CS/CE departments* in North America, and CS doctoral production hit a record high (up about 8% in a single year). The point: there is a large and growing landscape of strong programs beyond the top 10 (@sec:selecting-ranking-schools, @sec:chance-me), so cast a wide net.]

// % \subsection{R1, R2, ...}

=== Selecting and Ranking Schools <sec:selecting-ranking-schools>
#figure(
  image("files/c1.png", width: 80%),
  caption: [How _not_ to choose schools (@sec:selecting-ranking-schools). Source: #link("https://phdcomics.com")[PhD Comics] (© Jorge Cham).],
) <fig:schools-comic>

#caution-block[*When conventional advice fails:* "Ignore rankings and choose based on fit" assumes that you already know how to evaluate fit. Most applicants do not. Rankings are a crude filter, but an imaginary sense of fit based on a polished faculty webpage is not automatically wiser. Use rankings to discover programs, then investigate the people, funding, and alternatives inside each program.]

Many students put universities into two bins: (i) top schools that they dream about, and (ii) everything else. They often use rankings from US News, which is not transparent and questionable (@chap:rankings). Sometimes they evaluate based on the reputation of the school's undergrad program or the reputation of the school's non-CS programs such as medical, math, or physics.
Many international students rank universities based on popular places they know in the US, e.g., California, Texas, and New York.

#figure(
  image("files/cspicks3.png", width: 90%),
  caption: [Using CSPicks to compare between CMU vs UIUC.],
) <fig:cspicks-compare>

Instead of these superficial criteria, you should specifically consider the CS program and the research interests of faculty members (@chap:research-achievements).
You can learn about these using resources such as #link("https://cspicks.roars.dev")[CSPicks] and #link("https://csrankings.org")[CSRankings.org] (@chap:rankings).
@fig:cspicks-compare and @fig:cspicks-gmu show the research strengths of CS programs using CSPicks. 
You will be very surprised to learn that a school that you didn't know much about can have very strong research in your topic (and vice versa, a school you thought highly about might have no faculty working in the research field you're interested in). This is also a good way to learn about individual faculty, e.g., who works on what, and well-known CS conferences#footnote[In CS (and probably only in CS), conferences, not journals, are often the main venue to publish research findings (see #link("https://homes.cs.washington.edu/~mernst/advice/conferences-vs-journals.html")[why here]).]. If you'd rather not go school-by-school, CSPicks' "Discoveries" page surfaces some of these surprises automatically, e.g., departments rising fastest in a subfield or punching above their rank in a specific area.

#note-block[*Dat*: Most Vietnamese students, including those from top schools, *do not know* about CSRankings. Maybe applicants who worked at top research places such as VinAI would know about it.]

*What matters to you?* While many find CSRankings and CSPicks useful, they are still superficial as every other ranking (@chap:rankings). You should not just look at the number of papers or the number of faculty in your area. You should also consider the quality of the faculty, e.g., how many of them are tenured, well-known in their field, and have a good publication record. You can find this information from their CVs or their homepages. You can also check their #link("https://scholar.google.com")[Google Scholar] profiles to see their h-index and i10-index. See @chap:choosing-advisor and @chap:research-achievements for more details on how to find and evaluate faculty.

You should also consider other factors that matter to you. You might prefer schools that give stable funding (@chap:funding) and good stipend (@sec:ra-cost). You might like areas with a large community from your country---Northern Virginia, for example, is very diverse and has a large population of Vietnamese. You might want to be near high-tech industrial hubs like Seattle or Silicon Valley, or places with plenty of outdoor activities such as hiking and skiing. Weather can also be important---_"PhD can be depressing, so would you rather be depressed in California or New York?"_. Finally, don't forget about things like cost of living---certain areas in California and New York are way more expensive than in Nebraska. Safety is another factor; however, while some universities might be in a high-crime city, the campus itself is very safe---like John Hopkins in Baltimore.

If you get admission to several places, you should consider attending Open Houses (@chap:accepted) and contact profs. that you're interested in at those places and talk to them. They would be more willing to chat with you now that you have been admitted. Ask questions about #link("https://roars.dev/phd-cs-us/advising.pdf")[their advising style], how they manage their lab, and their expectations. You can even ask to contact their students.

#example-box[*Xiaokuan*:
  Chinese students often only look at US News rankings when selecting their PhD universities (I did that, too, when I was applying for PhD positions).
  Now that I am a professor, I find it to be the least promising way.
  
  The reason is that US News does not provide a good metric for evaluating the quality of the PhD program.
  
  If you want to do great research, CSRankings is the best way to find good and active professors (which did not exist when I was applying),
  since it solely focuses on publications at top-tier CS conferences.
  
  Also,
  I think PhD is not only about research;
  you need to also consider your daily life there since you will (probably) stay for at least five years.
  
  You might regret it if you did not consider this seriously before applying.
]

#note-block[When selecting schools, keep in mind that there are many good schools in the US and that the differences among them might not be that significant. For example, schools in the top 10 (@sec:csrankings) are likely in the same equivalent class, top 20 are in the same equivalent class, and so on. In addition, the lower ranked universities can have subfields that are very strong (NCState is top 40, but in Software Engineering it is easily top 5). This is in contrast with universities in other countries such as Vietnam, where there are large gaps among the top 5, 10, and so on.
]


=== Large/Well-known vs. Small/Unknown Programs

The "feel-good" advice is to go where it fits you and a good advisor is the most important. But, how do you know what would or would not fit you if you have never been there? Also, how do you know if a prof. is good and compatible with you or not if you have never worked with them? So while this advice sounds good, it is vague and not actionable because you do not have enough information to decide.

In addition, while @sec:selecting-ranking-schools talks about various factors (e.g., faculty interests, locations, funding), most students, especially international ones, simply do not have the information or experience to evaluate these factors properly. Even if you _think_ you know, you might be wrong. For example, many students think they want to be in California because of the weather, but they might do just fine in colder places like Wisconsin or Michigan or hotter places like Texas and Arizona.

So I will be direct and say that _if you don't have any strong preference_ (i.e., you don't know much about the schools or profs), then _if you get into a large/well-known program, you should strongly consider going there_. These programs typically have more resources, more faculty, better students (to work with), and more opportunities (e.g., internships, jobs). Note here that "large/well-known" is subjective and relative. For simplicity, I refer to the top 50 CS programs from CSRankings (@sec:csrankings) in the US as large/well-known.

#note-block[
  Many PhD candidates face this similar dilemma when they apply for faculty jobs. In most cases, when everything else is equal, they would choose the top school for similar reasons: more resources (e.g., funding and support from the university) and better students (which are critical for research).

  The main difference is that these PhD candidates have more information (e.g., they spent 6--7 years in grad school in the US). For example, they know and prefer West Coast over East Coast because of the culture and lifestyle. They might want a location closer to their family and friends.
  For these folks (who are about to enter the work force and sometimes already have families), these things matter, and they are willing to sacrifice some prestige and opportunities just to be in a place that fit them (and their family) better.
]

One important thing is that large programs have many faculty in diverse research areas. That means if you don't get along with one prof., you can switch to another one. In contrast, in a small program, if you don't get along with your prof., you might be stuck or have to transfer to another school (which is very troublesome).

That said, an advantage of being at a small program is that you can easily stand out. With just a NeurIPS or PLDI paper, you can be the star in your research group and even the entire CS program and can graduate quickly. In contrast, in a large program, those same papers might not get you much attention and you are under more pressure to publish more.

#tip-block[
  There are always trade-offs, but I've found that young students---without the burdens of family or other major responsibilities---benefit most from being pushed and exposed to opportunities. As Steve Jobs said, _"Stay hungry, stay foolish."_ You should go where you'll be challenged to grow the most, and large, well-known CS programs typically provide that.
]



// % \subsection{Strong Faculty vs High-ranked School}
// % \begin{commentbox}[Thanh:]
// %   When considering PhD programs, we often wonder if we should prioritize a high-ranking university or a professor with a strong reputation? Of course, both are great, but it is hard to achieve both.  I believe receiving some guidance from you  would be incredibly valuable.
// % \end{commentbox}

// % The general advice is to prioritize a strong faculty member over a high-ranked school because your success in research depends more on your advisor than the school's name. Still, a good school can provide better resources, networking opportunities, and a more competitive environment---and there's always that "household name" that makes you feel good. So ranking does matter!


=== PhD in other Related Fields: CE, IST, Cybersecurity <sec:related-fields>

You *do not* need to do a PhD in CS to do research in CS. For example, in addition to a traditional CS department, GMU has IST and Cybersecurity departments, both of which have faculty with PhD in CS and work on CS topics (e.g., AI, Security, Robotics). So you still can do CS research and publish in CS-focused venues even if you're not in a traditional CS program. It is common to see faculty with PhD in CS in a non-CS department as well as faculty with non-CS PhD in a CS department.

However, if your goal is a PhD in CS, then you need to be in the CS dept. _and_ advised by a CS faculty. A non-CS faculty can serve in the PhD dissertation committee (common) or _co-advise_ (less common, but possible) PhD students in CS, but your main PhD #gls("advisor") will likely be a tenure-line faculty in CS (@sec:faculty-types).
For example, a prof. in Stats or Math might be able to serve as a co-advisor, but not as a sole advisor of a student in a CS PhD program.
If in doubt, check with the CS dept. for their requirements.

It is possible to transfer between departments (and universities). However, this can be complicated and often requires re-applying to the new department and taking additional coursework or exams required by the new place. Moreover, your advisor may not be able to supervise you in the new department (they can co-advise or serve on the committee, but unlikely are allowed by the new department to be your main advisor). Usually, transfers happen because the current advisor moves to a new department or university, and the student wants to stay with them.

For this specific reason, CSRankings and CSPicks focus on faculty who can advise CS PhD students. I also have compiled a #link("https://roars.dev/phd-cs-us/viet-cs-profs-us")[list] of Vietnamese faculty who can advise PhD students. @sec:faculty-types discusses more about who can serve as your PhD #gls("advisor").

// %\section{Comparison Factors}

// % \subsection{Private vs. Public Universities}


// % So here are some concrete factors to consider when choosing between large/well-known vs. small/unknown CS programs.

// % \begin{table}
// % \centering
// % \caption{Comparison between Large/Well-known vs. Small/Unknown CS Programs <tab:large-vs-small}
// % \begin{tabular}
// % {r|c|c}
// %   \toprule
// %                            & \textbf{Large/Well-known} & \textbf{Small/Unknown} \\
// %   \midrule
// %   \textbf{Faculty}         & Many, diverse research    & Few, focused research  \\
// %   \textbf{Students}        & Many, diverse             & Few, less diverse     \\
// %   \textbf{Funding}         & More, competitive         & Less, stable          \\
// %   \textbf{Reputation}      & High                      & Low                   \\
// %   \textbf{Opportunities}   & Many, competitive         & Fewer, less competitive\\
// %   \bottomrule   
// % \end{tabular}
// % \end{table}
// % \subsection{Prestige vs. Opportunities}

=== University Hierarchy

// \begin{figure}
//   \centering
//   \caption{University Hierarchy and Influence on CS PhD Admissions <fig:university-hierarchy}
// \begin{tikzpicture}[
//   scale=0.8, transform shape, % <-- adjust scale factor here
//   node distance=1.2cm and 2cm,
//   box/.style={rectangle, draw, rounded corners, align=center, minimum width=3.3cm, minimum height=1cm, font=\small}
// ]
// % Top
// \node[box] (board) {Board of Trustees / Visitors};

// % Exec side
// \node[box, below=of board] (president) {President / Chancellor};
// \node[box, below=of president] (provost) {Provost};
// \node[box, below=of provost] (grad) {Graduate School Dean};
// \node[box, below=of grad] (dean) {Dean (Engineering / A\&S / Computing)};
// \node[box, below=of dean] (chair) {CS Department Chair};
// \node[box, below left=of chair] (adcom) {Adcom/Potential Advisors};
// \node[box, below right=of chair] (staff) {Faculty / Admin Staff};
// \node[box, below=2cm of chair] (students) {PhD Admission};

// % Governance side
// \node[box, right=5cm of provost] (senate) {Faculty Senate};

// % Connections
// \draw[->] (board) -- (president);
// \draw[->] (president) -- (provost);
// \draw[->] (provost) -- (grad);
// \draw[->] (grad) -- (dean);
// \draw[->] (dean) -- (chair);
// \draw[->, dashed] (chair) -- (adcom);
// \draw[->] (chair) -- (staff);
// \draw[->] (adcom) -- (students);
// \draw[->, dashed] (staff) -- (students);

// % Senate influence
// \draw[->, dashed] (senate) -- (provost);
// \draw[->, dashed] (senate) -- (grad);
// \draw[->, dashed] (senate) -- (dean);

// % Legend
// \node[draw, align=left, font=\scriptsize, anchor=north west] at ($(students.south west)+(-0.2,-1.2)$) {
// \begin{tabular}{@{}ll@{}}
// \raisebox{0.5ex}{\tikz{\draw[->] (0,0)--(0.6,0);}} & Reporting line/Direct Influence \\
// \raisebox{0.5ex}{\tikz{\draw[->, dashed] (0,0)--(0.6,0);}} & Indirect Influence\\
// \end{tabular}
// };
// \end{tikzpicture}
// \end{figure}



#import "@preview/fletcher:0.5.8": diagram, node, edge

#figure(
  scale(80%, diagram(
    node-stroke: 1pt,
    node-corner-radius: 2pt,

    // Nodes (column, row)
    node((0,0), [Board of Trustees / Visitors], name: <board>),    
    node((0,1), [President / Chancellor], name: <president>),
    node((0,2), [Provost], name: <provost>),
    node((0,3), [Graduate School Dean], name: <grad>),
    node((0,4), [Dean (Engineering / Art and Science / Computing)], name: <dean>),
    node((0,5), [CS Department Chair], name: <chair>, fill: yellow.lighten(50%)),
    node((-0.6,6), [Adcom / Potential Advisors], name: <adcom>, fill: yellow.lighten(50%)),
    node((0.6,6), [Faculty / Admin Staff], name: <staff>, fill: yellow.lighten(50%)),
    node((0,7), [PhD Admission], name: <students>, fill: yellow.lighten(50%)),
    node((1,1), [Faculty Senate], name: <senate>),

    // Main chain
    edge(<board>, <president>, "->"),
    edge(<president>, <provost>, "->"),
    edge(<provost>, <grad>, "->"),
    edge(<grad>, <dean>, "->"),
    edge(<dean>, <chair>, "->"),

    // Chair branches
    edge(<chair>, <adcom>, "-->"),
    edge(<chair>, <staff>, "->"),
    edge(<adcom>, <students>, "->"),
    edge(<staff>, <students>, "-->"),

    // Senate influence
    edge(<senate>, <provost>, "-->"),
    edge(<senate>, <grad>, "-->"),
    edge(<senate>, <dean>, "-->"),
  )),
  caption: [University Hierarchy and Influence on CS PhD Admissions],
) <fig:university-hierarchy>


Adcom has direct influence over admissions decisions (@sec:adcom), but they operate within a larger university hierarchy that can impact those decisions. For example, enrollment and funding levels may lead to changes in admissions criteria or the number of students accepted (e.g., TA reduction). @fig:university-hierarchy illustrates the typical hierarchy in a US university and how different entities influence CS PhD admissions.

==== Top Governance and Executive Administration
The Board, President or Chancellor, and Provost control university-level budgets, policies, and faculty growth. They do not read your application. They matter because a budget cut, hiring initiative, or new college can change how many faculty and TAs the department can support---and therefore how many PhD offers it can make.

==== Shared Governance
The *Faculty Senate* represents faculty and may influence curriculum, graduate requirements, and academic policy, but it does not evaluate individual applicants. I serve as a faculty senator at GMU; in my experience, this work can shape the rules around a program but is far removed from deciding whether a particular applicant is admitted.

==== Local Units (College/School/Dept)
Colleges and schools control budgets and enrollment targets; departments control the local implementation. A dean may fund more TA positions or authorize faculty hiring, while the CS chair determines priorities and appoints the adcom. These officials normally do not choose individual applicants, but they determine the size and shape of the pool the committee is allowed to admit (@sec:how-decisions).

The people who matter directly to _your_ application are much closer to the bottom of @fig:university-hierarchy: the assigned adcom reviewers and potential advisors. Faculty can advocate for students they want to advise (@sec:applications-assigned); administrative staff verify and process the file but do not decide its academic merits.

#caution-block[*What applicants get wrong:* Writing to a dean, provost, or department chair rarely creates influence. It usually reveals that you do not understand who evaluates the application. Contact a plausible advisor about research fit, and contact staff about missing documents or procedure.]


#pagebreak()
== Choosing an Advisor <chap:choosing-advisor>
//#chapter-opener([The best advisor is the one that *fits*, e.g., you can work well with, and has the ability to help you succeed. But you do not know that until you start working with them.])

#simpsons[It's not easy being a mentor. But it sure is funny to watch other people screw up.]

There is no one-size-fits-all answer to finding an #gls("advisor"). The best advisor is the one that fits you, e.g., you can work well with, and has the ability to help you succeed. But how do you find such a person?

#caution-block[*When conventional advice fails:* "Choose a good advisor who fits you" is empty advice unless it tells you what to investigate. You cannot observe compatibility from a homepage. Ask how often the professor meets students, who chooses problems, how authorship works, what happens when a project fails, where funding comes from, and why students have left the group. Then verify the answers with current and former students (@sec:visit-days).]

Fortunately, while some non-US programs require finding an advisor and research topic before starting the PhD (@sec:non-us-differences), CS PhD programs in the US will typically give you a couple of years to "shop" for advisors and research topics. This is especially true if you're admitted with GTA (@sec:ta), which gives you time to explore and find an advisor.

#note-block[Prospective PhD students often refer to potential advisors as #glspl("PI"), which commonly means a lead investigator in a research project or grant. I rarely see it used in the context of CS PhD advising, and was a bit surprised when I first heard of it used that way.
]

=== Finding an advisor <sec:finding-advisor>

Assuming you're not familiar with any particular profs., then _first_ search for those that share similar research interests. For example, in CSRankings and CSPick, if you want to work with PL, you can search for those published in PL conferences. If you want to work with SE _and_ AI, you can search for faculty who work in both SE and AI, or in #link("https://cspicks.roars.dev")[CSPicks] directly compare the two areas (e.g., "SE vs AI") to see who publishes in both.

_After that_, you can research about that prof. by going to their website, looking at their research achievements and awards (@chap:research-achievements), checking their #gls("research-lab", first:true), seeing if they have recent publications, and reading their papers. Sometimes they would explicitly say they are looking for students and state their expectations. In some rare cases they even have an advising guideline like #link("https://roars.dev/phd-cs-us/advising.pdf")[this] to help students understand more about their personality and advising style.
If you find a #gls("POI", first:true)---a prof. you'd like to work with---you can reach out to them (@sec:contact).

#tip-block[*Xiaokuan*:
  Whether the student's research interest matches that of the advisor is very important;
  if there is a mismatch,
  either the student or the advisor has to make compromises,
  which often leads to disagreements or conflicts.
  IMO, the advisor should be the one who _guides_ students to do research while allowing students to pursue their own interests,
  instead of _dictating_ their research.
]


Another way is taking graduate-level courses in the topics you are interested in. Many profs teach _special topics courses_ and _research seminars_, and they might be recruiting students. Do well in the class, answer questions, talk to the prof. after classes, etc---being stand out. Many profs, including myself, prefer taking in new students this way. It gives both the prof and student more time, e.g., a whole semester, to work and evaluate the relationship before making any commitment (sounds like a marriage!).

You can also ask to do an independent study or research with a prof. This can be informal (no credits) and takes place during the summer or winter break. For example, I do this with several students, some of whom are undergrads. Many will drop out because they find they don't like my research, but some find that they like the work.

Ultimately, choose a prof. that fits you by communicating with them, taking their courses, meeting and asking them questions, and talking to their current students. It will take time and effort, but since you will be working with this person for 5+ years, it is important to try to find the right one.

#example-box[*Thanh*:
  In my opinion, having a well-suited advisor is crucial for a successful PhD and research career. One effective approach to finding a suitable professor is by working with a professor during your undergraduate studies. An exemplary instance is VinAI's residency program, where residents collaborate with professors from the US for two years before applying to PhD programs. Many VinAI residents have achieved remarkable results and gained admission to prestigious US universities. Unfortunately, VinAI's resident program is limited to AI research.

  In other fields, e.g. Software Engineering, Vietnamese students face challenges in reaching US professors. Do you have any tips for Vietnamese students who want to connect with US professors and work as research assistants?

  *Vu:* @sec:contact shows how to contact a professor for research opportunities. Many will say no (or do not reply) as they do not have the bandwidth to take on random students, but some may say yes if they see a potential fit.
]

// % \subsection*{Additional Resources}
// % \begin{itemize}
// %   \item \href{https://www.cs.columbia.edu/wp-content/uploads/2019/03/Get-Advisor.pdf}{The Definitive "what do I ask/look for" in a PhD advisor Guide}
// % \end{itemize}

=== Types of Faculty: Who Can Serve as a PhD Advisor? <sec:faculty-types>

_*Not every faculty*_ can serve as your official PhD advisor. Understanding the different types of faculty roles such as  tenured, tenure-track, teaching, research, adjunct, and emeritus professors will help you avoid common mistakes, e.g.,  contacting the wrong person (@sec:contact) for research opportunities or listing in your SOP (@chap:sop) someone who can't actually supervise PhD students.

#definition-box[Faculty Types][At most #gls("R1") universities, faculty fall into two categories:
+ Tenure-line faculty (tenured or tenure-track)
+ Non-tenure-line faculty (e.g., teaching, adjunct, or research faculty)
]
The key distinction is in their responsibilities—whether they are expected to do research, get funding, and supervise PhD students or primarily focus on teaching.

==== Tenure-Line Faculty

_Tenure-line_ faculty members are expected to perform research, publish in top venues, get funding (@sec:ra), and mentor PhD students. They typically teach fewer courses—often just one per semester—and are the *main group eligible to serve as primary PhD advisors*. 

#definition-box[Tenure-line Faculty][Tenure-line faculty consist of two subcategories:

- *Tenure-track faculty* are on the path to tenure and are often actively recruiting students.
- *Tenured faculty* have already earned tenure or permanent status and might be less active in research or more selective in recruiting new students.
]
#emph-block[
  *If you're reaching out to professors about potential advising, focus on tenure-line faculty*. These are the faculty most likely to have funding, institutional authority, and the capacity to take on new PhD students. See @sec:tenure-vs-tenure-track for more on choosing between tenured and tenure-track faculty as advisors.
]

==== Teaching Faculty

_Teaching faculty_ (also called instructional faculty, professors of practice, or lecturers) primarily focus on teaching. They often teach three to four courses per semester and are _not_ expected to conduct research, publish papers, or apply for funding.

Thus they usually do not have the resources or institutional role to advise PhD students, especially as the main advisor. In some universities, they may co-advise a PhD student alongside a tenure-line faculty member, but this is rare and varies by institution.

*Do not contact teaching faculty to ask about PhD or research positions in their lab*. They're usually not involved in PhD admissions, and such emails can be annoying to them.

#tip-block[
  Although teaching faculty are not typically involved in PhD admissions or research, some actively mentor undergrad students in research—especially during the summer. So if you're an undergrad (@chap:research-opportunities) and want to try research, you can contact them (usually after taking their class and doing well).
]

==== Postdoc, Research Faculty and Scientists

_Postdocs_ are temporary research positions for recent PhD graduates, typically lasting 1-3 years in CS. They are typically not considered faculty and do not have the institutional role to advise PhD students. 
Think of them as "super grad students" who also have an advisor/mentor (the PI) and are expected to do research and publish papers just like grad students.

Some universities have _research faculty_ or _research scientists_. Like postdocs, they focus almost entirely on research and often have little or no teaching duties. These faculty members can apply for grants (which in many cases directly pay their salaries) and, in some _rare_ cases, can serve as advisors for PhD students. In such cases, they are often required to co-advise with a tenure-line faculty member.

==== Adjunct and Emeritus Faculty

These faculty members are typically not involved in research or PhD advising. _Emeritus faculty_ are retired professors and are usually no longer active in research or advising. Note that emeritus _does not_ necessarily mean they are old or inactive, just that they have retired from their official faculty position.

_Adjunct faculty_ are typically part-time instructors who may have a full-time job outside academia#footnote[Fun fact: Mike Pence, who was the former Vice President of the United States, is an adjunct faculty member at George Mason.]. They are usually only affiliated with the university only for their period of teaching contract (e.g., one semester) and thus do not have the institutional role to advise PhD students.

Because of their limited roles, adjunct and emeritus faculty do not serve as PhD advisors. So, do not contact them to ask about research openings.

#example-box[
This #link("https://www.reddit.com/r/gradadmissions/comments/1iyt2k8/_/")[Reddit thread] shares an example of a student being rejected after listing emeritus professors in their SOP. This is a common mistake, especially for international students who are not familiar with the US system.
]

==== Faculty from Other Departments

Most universities restrict who can advise PhD students based on departmental affiliation. For example, even a tenured faculty member in another department (e.g., Electrical Engineering or Math) may not be allowed to serve as the primary advisor for a CS PhD student unless they have a formal joint appointment (@sec:related-fields).

So check these carefully as this is different from one university to another.

#caution-block[
  University websites might not be up to date and still list faculty who are no longer active or have moved to another institution. In some rare and extreme cases, they might even list deceased faculty (no kidding!). In fact, even the faculty themselves might not update their websites. So do multiple checks, e.g., Google, recent publications, etc.
]

==== Ranks (Assistant, Associate, Full, and More)

#definition-box[Faculty Ranks][Regardless of type---tenure-line or teaching---faculty are generally assigned one of three academic ranks:
+ *Assistant*: typically an early-career faculty member
+ *Associate*: mid-career, often after tenure
+ *Full*: senior, often tenured with a strong record of achievement
]

Tenure-line faculty generally start as assistant professor, undergo a rigorous review around year six, and if successful are promoted to associate professor with tenure. Note that getting tenure is a huge deal, and it might change the way they work with students (@sec:tenure-vs-tenure-track).

The timeline for becoming a full professor varies widely; some do it within a few years after tenure, others take a decade or more, and some become emeritus faculty without ever reaching full professor status. Teaching and research faculty may also progress through these ranks, though the promotion criteria and timelines differ.

In addition to these ranks, some faculty hold special titles such as

- *Endowed Chair* and *Named Professor*: funded by a private donor; typically awarded to highly accomplished faculty or to attract junior faculty.
- *Distinguished Professor*: recognized by the university for exceptional achievement
- *University Professor*: a title reserved for a small number of faculty with extraordinary impact

Professors with these titles are often tenure-line faculty, and therefore can advise PhD students. However, they may not be as available, especially if they are in high demand or have administrative responsibilities. For example, many department chairs are endowed chairs or distinguished professors, and they might not be too active in research or advising students.

=== Tenured or tenure-track faculty? <sec:tenure-vs-tenure-track>

#figure(
  image("files/c8.png", width: 55%),
  caption: [Life before vs. after tenure: an un-tenured (#gls("tenure-track")) professor is under intense pressure to produce, while a tenured one has far more freedom. This matters when choosing an advisor (@sec:tenure-vs-tenure-track). Source: #link("https://phdcomics.com")[PhD Comics] (© Jorge Cham).],
) <fig:tenure-comic>

Now that you know a bit about tenured and tenure-track faculty (@sec:faculty-types), which one should you choose as your advisor? How do you know if one would fit you better than the other?

Either can be a good advisor, but they have different strengths and weaknesses. The below gives some ideas; however, the best indicator of their research productivity and impact is their publication and recognition record (@chap:research-achievements). Some profs. publicly share their advising style and expectations, like #link("https://roars.dev/phd-cs-us/advising.pdf")[this] and #link("https://jbhuang0604.github.io/advisor_guide.html")[that], to help prospective students decide.

#caution-block[Faculty do not recruit students out of pure generosity. 
Yes, we want to mentor and are happy to see students succeed, but we also have incentives.
We need students to help turn grants and ideas into papers, software, and trained researchers. A junior professor may invest enormous time in you because your success is tied to their tenure case. A senior professor may offer a powerful network but have less time because they already manage a large lab, company, or administrative role. These incentives are not automatically good or bad, but they are important to understand when choosing an advisor.]

*Tenure-track faculty*—like assistant professors—are typically young and active in research (they have to be, to get tenure). Thus, they will devote more time to work with you and push you to do research and publish. However, you might not become too independent because they may be too hands-on with you. For example, you might not learn how to fully form research ideas, design experiments, and write papers on your own. Also, they may not have as much experience in managing students or may not yet have substantial funding.

*Tenured faculty*—associate and full professors—are likely older, more well-known, and have more experience in managing students. However, they might not push you as hard and will expect you to figure things out yourself, i.e., you need to be independent. Some tenured faculty are also no longer active in research and are more involved with administrative responsibilities or their startup companies (which means they will likely not take new students).

#tip-block[*Hung*:
  I always encourage the students I admit to talk with my students and the students of other faculty in other schools who admitted them. You will unlikely hear straight-out complaints from current students in a prof's group. But sometimes what is important are things that they (current students) don't tell you. Pay attention to their "level of excitement" being in the group.
]

=== Faculty from Your Country <sec:prioritizing-faculty>

Understandably, many students prefer to work with faculty from their own country (e.g., 
Chinese students with Chinese faculty, Indian students with Indian faculty
). You feel more comfortable as they share the same language and culture, understanding your schools and background, and that they "get" you. So it is perfectly fine to start with faculty from your country (e.g., a #link("https://roars.dev/phd-cs-us/viet-cs-profs-us")[list of Vietnamese CS faculty] in the US).

However, this should not be the main reason for choosing a faculty (@chap:choosing-advisor), and you should expand your search to include faculty from other countries. Research and higher education in general encourage exploration, e.g., students often go to different grad schools than their undergrad schools, and switching fields (and even advisors) is more common than you might think. It also won't be fun to be in a lab with students with similar background all speaking the same language all the time; you will not learn as much from each other.

#example-box[
  My #link("https://roars.dev")[Roar] lab has many Vietnamese, but I also have many non-Vietnamese students, e.g., from China, Romania, Rwanda, Pakistan, and most of my undergrads are domestic US students (@chap:domestic-students). It is more fun this way—they get to learn from each other and share different perspectives and cultures
  (it also amazes me how knowledgeable and enthusiastic students are about food!).
]

Some students might hesitate to apply to a lab where they see the faculty has many students from their country already, i.e., thinking that it's a red flag. They might think they won't fit in or the prof. is biased toward students from their country.

However, the main reason a prof. has many students from a particular country can simply be because students from that country apply more to that prof. Vietnamese students tend to apply to Vietnamese profs. more, Chinese students tend to apply to Chinese profs. more, etc. Most profs., in my experience, _do not_ have preference for students from any specific country and simply take students who are a good fit for their research group.

Thus, don't worry about this too much and just apply to the profs. you think are a good fit for you (@sec:finding-advisor). In fact, this might be an _advantage_ because profs. who have many students from their own country might want to diversify their group and take students with different backgrounds.

=== Should I Contact a Prof. Before Applying? How to Get a Positive Reply? <sec:contact>

//Faculty members _cannot directly admit_ a student: so do not email and ask if you have a chance. However, faculty can _advocate_ for a student with adcom and therefore increase their admission chance: so contact and introduce yourself.

Faculty often receive "cold" emails from prospective students. Most of the time, we #highlight[just ignore such emails] (@sec:busy), but on some rare occasions, we do answer them. _So how to write an email that gets our attention?_

#caution-block[*Do not ask a professor to predict your admission chances.*  if you want to contact a prof. with the purpose of checking about _potential admission chance_, *don't*. We don't know and can't answer because, as explained in @chap:evalapps and @sec:direct-vs-committee, we don't make individual decisions and might not even be assigned to evaluate your application. It is the same as sending a paper draft to a journal editor or program chair and asking them if your paper has a chance. 

So how to get someone to look at your profile and give input? You could ask your professors, LOR writers, collaborators, or those who have previously applied. For this kind of feedback, ask someone you have a personal connection with.
]


If you want to contact a prof. to ask about research opportunities, or _GTA/GRA_ support (@sec:ta-ra), then while it is still a _very_ long shot (you likely won't get any reply), it is _worth trying_ (and I say this even though I do not reply to most of these emails; see @sec:kiss-of-death-emails for why). However, you really need to put effort into it and do it the _right way_ to get a positive reply.

#tip-block[A professor replies when the expected value of the conversation exceeds its cost. Junior faculty may urgently need students for a new grant or to build a lab; another professor may already advise ten students, lack funding, or don't find your background matching their work. Silence is often about bandwidth and incentives, not a verdict on your worth. A good email lowers the cost of evaluating you and gives the professor a concrete reason to imagine working with you. If that interest turns into advocacy, it can greatly affect the review described in @sec:ievaluate and @sec:how-decisions.]

You need to _customize your email_ for them and _make yourself stand out_ from the crowd. First, write a personalized email so that it is about how/why their work would match yours, how you have followed their work and did what they ask from their website (if they have any). In contrast, if you write a generic email that can be sent to multiple professors (e.g., if you just change some names and keywords in the email or copy and paste paper titles), you will not get a response.

Below is a good example:

#emph-block[
  Dear Prof. Nguyen,

  I am writing to inquire about potential research opportunities as a GRA in your group at GMU. Currently, I am an undergraduate student in Computer Science at UNIV and plan to graduate in May 2023.

  _[a very strong version and customized specifically for me]_ I have followed your instructions on your website and created a PR to fix the GitHub issue X in your project Y. I also notice that the project might benefit from some additional features, e.g., Z, and I am working on a PR for it.

  _[also strong, but more conventional and a bit boring]_ I have read your TSE'21 paper on numerical invariant generation, and I am interested in this line of dynamic invariant research. I have worked (optional: with prof. Y at Z) on static program analysis and I think it could be used to tackle the spurious issues mentioned in your paper. I have a short paper at conference/workshop C and a project on symbolic execution (GitHub repo G).

  _[something more personal and will catch my attention]_ I also have read your advising guide emphasizing independence and result-oriented research, and I think this is a good fit because ...

  ---

  _[This is a good example because it is written just for me. It shows that the student has done their homework, followed my instructions, and knows my work well.]_
]

Many profs. explicitly state on their website how prospective students should (or should not) contact them, e.g., using specific email subjects and additional information (e.g., read specific papers, try some programming tasks). If they don't state anything, you can still customize your email by showing that you have read their papers know their work. This is a good way to show that you are genuinely interested in their work and not just sending a generic email.

#example-box[
  On my lab #link("https://roars.dev")[website], I have a section on _Prospective Students_ that lists how to contact me and what information to include or exclude in the email. I also have an #link("https://roars.dev/phd-cs-us/advising.pdf")[advising guide] to help students understand more about my advising style and lab culture.

  For example, recently, I ask that they contribute a bit to one of my projects, e.g., create a pull request to fix a bug or add a feature. This shows that they have done their homework and are genuinely interested in my work. This effectively filters out those who are not serious or not interested. I do this for both graduate and undergraduate students.
]

Second, and probably more importantly, is to make yourself _stand out_. It is not difficult to customize the email (especially nowadays with the help of AI), thus the very few students that both customize _and_ stand out will get our attention. Standing out (@sec:stand-out) varies from person to person and can range from the classic ways of having good publications in top conferences and having strong recommendations from well-known profs (e.g., people I know) to having strong technical skills (e.g., winning well-known competitions such as IMO and developing significant start-ups or popular open-source projects). In fact, most CS research groups develop open-source software and having contributions (e.g., finding and fixing bugs, creating pull requests, etc) to these projects is a great way to stand out. @fig:email shows an example of being stand out by solving a problem that the prof. has.

#figure(
  image("files/email.png", width: 80%),
  caption: [Example of a good way to contact a professor: by solving a problem they have!],
) <fig:email>


Finally, profs. are busy (@sec:busy), so don't take it personally if you don't get anything from them (though I would be surprised if you did all the above correctly and still don't get a reply). See @sec:kiss-of-death-emails for common mistakes in emails and @sec:interpreting-response for interpreting replies.

#tip-block[*Xiaokuan*:
  Applying for PhD and contacting a potential PhD advisor is a classic _"why me, why you"_ problem, similar to looking for a job in a company. On a high level, you need to show that you have done your _homework_ regarding the professor and the university, and clearly explain:
  1) why do you think you are a good fit in professor A's group?
  2) why do you want to be advised by professor A, not B?
  3) why do you want to apply for university X, not Y?
  
  If you don't want to spend time doing your homework, the chance of getting a reply is close to zero.
]

#tip-block[*Deepak*:
  In my view, cold emails are not welcome by most faculty members and should be avoided. However, if one is already admitted to a program in some department, by all means, email the faculty you may be interested in working with, but do mention right at the beginning that you are already admitted to the program as well as several other universities. State specific areas (preferably specific topics—ML, robotics instead of AI).
]

==== Kiss of Death in Emails <sec:kiss-of-death-emails>

- *Send emails to the wrong prof.* Many students do not pay attention or know about this, but a very common reason why you don't get a reply is that you send emails to profs. who do not / cannot advise CS PhD students (e.g., adjunct, emeritus, teaching, non-CS). See @sec:faculty-types for details. //While these profs. might be able to co-advise, they typically do not have the bandwidth, funding, and the desire to mentor students for research (they are already overloaded with teaching and other service duties).

  So do some homework before sending emails, e.g., most CS profs. who are active in research will have a website with their work (publications) and students; some also have lab websites dedicated to their group. Most teaching and adjunct profs. do not have a research group or students listed on their website.

- *Generic.* You should already know this! A copy-and-paste kind of email or those that can be sent to multiple people with very little modifications show the lack of interest and will be treated as spam. Most likely, we will not reply to these emails.

- *Self-focus.* Focusing too much about you and your achievements but not why you are interested in the prof.'s work (@sec:contact). Mention why you're interested in their work and how your background can contribute.

- *Too long.* Keep it to about 3--4 short paragraphs. Less is more and too-long emails are often not read and discarded. Don't attach course transcripts or test scores in the first email. If they are interested, they will ask for them. Attaching your CV is OK. Sample papers (@sec:writing-sample) and links to your #gls("arxiv", first:true) #gls("preprint")s or GitHub projects are also OK if they are relevant.

- *Flowery greetings and language.* Don't use "Dear esteemed professor". Do not call the prof. by their first name in the first email (some don't care but you don't want to take the risk—you don't know them that well yet). Do not use Mr., Mrs., etc. To be safe, use Prof. Lastname or Dr. Lastname (@sec:address).

- *Ignoring the Prof's guideline* and asking questions that are already answered on their website. Many profs. put very specific information on how to contact them on their website (e.g., email subject, what to include). Following this helps you stand out and increase your chance of getting a reply.

- *Mass Emails.* I've seen it many times when a student mass emails all profs in a department, e.g., through CC or even BCC. This will result in no reply or a very harsh one on how unprofessional you are.

- *Do Not Call.* Not related to email but sometimes students get desperate and call the prof. This is a big no-no, especially for CS people who often prefer email over phone calls.

- *Fancy format.* Do not use colors, fancy fonts, or formats, e.g., bold. While not really a kiss of death, it is very annoying, especially for people in CS (and probably many other fields) who often prefer plain email messages.

==== Interpreting Response <sec:interpreting-response>

Even if you avoid the kiss of death emails (@sec:kiss-of-death-emails), you might still not get a reply. There are many reasons why you might not get a positive reply, e.g., the prof. is not interested, they are too busy (@sec:busy), they are not taking students, etc. Here are some common responses and what they mean:

- *No reply.* This is by far the most common response (see why in @sec:busy). It means they are not interested. You might try again in a few weeks or months, but don't expect a reply. And after a couple of tries, you should move on.

- *Not taking students but encourage you to apply or just encourage you to apply in general* Polite way of saying not interested and referring you to the admission process. Note that this _does not_ in any way mean that they think you have a good chance of getting admitted.

- *Not taking students this year (but encourage you to check with them for next year).* Polite but generic response. Like the previous one, encouragement to apply does not mean they think you have a good chance of getting admitted.

- *Cannot admit you directly. Need to go through admission process.* Generic. They are not interested and refer you to the admission process.

- *Come talk to me after you're admitted.* Generic. Refer you to the admission process. But if you get admitted then you can reply to them and say you're admitted and would like to talk.

- *I am not taking students but I co-advise/can serve on your committee.* While this might sound good, it's still generic because it says _once you're admitted and have an advisor_, then contact me again.

- *I am not taking student but Prof. X might be.* Not common as most profs. do not refer you to their colleagues (to avoid misunderstandings @sec:busy and to avoid being responsible for the referral).
However, if this happens, it is better than the previous responses. While they cannot take you, they think you are a good fit for X. So follow up with a thank you and say you'll contact X,   then contact X and say that Y referred you to them.

In short, all of these replies mean the prof. is not interested. The best positive response is that they want more information from you, e.g., your CV, transcript, paper, or a chat, which is an interview (@sec:interviews).

==== Are Profs. So Busy That They Completely Ignore Emails? <sec:busy>

Profs. are busy. We have many deadlines, meetings, and emails, many of which are from prospective students looking for research opportunities or asking for application results. We also often underestimate how busy we are, thus making us even busier.
We also have a life outside of work, e.g., family, hobbies, etc.

However, this is _not_ why we "ghost" you and provide no response. One main reason is because we want to *avoid misunderstandings*. A response---no matter how clear we think it is---might be misinterpreted by the student (see some common responses in @sec:interpreting-response). For example, if we say we are not taking students but still encourage to apply, then the student might take it as a positive sign of admission (@sec:interpreting-response). If we say we are not interested, the student might interpret it as a personal rejection and not apply at all. So it is not because we are too busy to reply, but because we do not want misunderstandings and have to deal with them later.

But there's a good chance that we would respond to well-written emails (@sec:contact) that show the student has done their homework and is genuinely interested in our work. So (cold) emails are worth trying, but don't take it personally if you don't get a reply.

#example-box[
  I skim through _every email_ sent by students for admission and research opportunities (many of which are from undergrads and high school students). So that means I do read your emails, and they rarely go to my spam or trash folder. However, I rarely reply to them because most of them are generic and do not show any interest in my work (@sec:kiss-of-death-emails).
]

    
// %\part{Miscs and FAQs <part:faqs}
// %= Miscs and FAQs <chap:faqs}

// %\myepigraphsimpsons{"I want to share something with you – the three little sentences that will get you through life; number 1: Cover for me, number 2: Oh, good idea, Boss, and number 3: It was like that when I got here."}



// % \section{Member of an underrepresented or LGBTQ+ groups <sec:urm}
// % \sectioninfo{Being a minority can make you stand out and help your application.}

// % A common question is whether you should mention, e.g., in your SOP, that you are a member of an underrepresented and minority (URM) group\footnote{URM in CS in the US include African Americans, Hispanic Americans, American Indians/Native Alaskans, Native Hawaiians/Pacific Islanders (excluding Asian Americans), and multiracial students identifying with at least one of the previously listed URM categories.} or LGBTQ+ group.
// % The main concern is that you can be discriminated against or that you are asking for special treatment.

// % %This is a strong concern for international (and even domestic) students, who may have encountered discrimination in their countries or personal experiences. 
// % %This question arises often for international (and even domestic) students. The main worry is that they might get discriminated against, as often happen in their countries or personal experiences. %, and (ii) mentioning this might make them look like they are asking for special treatment.

// % In my personal opinion, highlighting URM or LGBTQ+ identity can \emph{be beneficial}, especially if you can articulate how your diverse experiences contribute to diversity and inclusion in academics.  Many universities have a strong commitment to diversity and inclusion and actively
// % \emph{recruit students from underepresentative backgrounds} (e.g., some \href{https://cse-climate.engin.umich.edu/reports/climate-dei-reports/cse-climate-and-dei-report-2022-2023/#grad-ethnicity}{stats from UMich CSE} and GMU often touts itself as one of the most diverse universities in the US). Moreover, many scholarships and fellowships are created specifically for URM and LGBTQ+ students, which you should explore if qualify.

// % Understandably, you might feel uncomfortable disclosing this, fearing you would lose a chance of working with a faculty due to their bias.  However, if someone has this issue, then you might not want to work with them anyway (and such bias is not acceptable in academics and likely would not be tolerated by the university). In my experience, it is often the opposite: \emph{many profs. actively seek to work with students from diverse backgrounds and view diversity as an asset to their research group}.

// % Moreover, promoting diversity aligns with the goal of broadening participation in computing (BPC) that is strongly supported within academia (e.g., see the \href{https://plans.bpcnet.org/GeorgeGMUUniversity_ComputerScience_DepartmentalBPCPlan.pdf}{BPC plan at GMU CS}) and government funding agencies such as NSF (e.g., see \href{https://new.nsf.gov/cise/broadening-participation}{here} and \href{https://www.nsf.gov/pubs/2022/nsf22125/nsf22125.jsp}{here}).
// % Providing this information can also make it easier for faculty to apply for certain scholarships or fellowships to support you, e.g., from a private donor that has offered a fellowship only to students from certain backgrounds.

// % Ultimately, this is a personal choice and you do what you feel comfortable.
// % If you do not feel comfortable disclosing this, you should not feel pressured to do so.
// % However, if you feel comfortable but are unsure if it is accepted in higher education in the US, then I hope this helps you understand that it is not only accepted but also valued and appreciated.

// %If uncertain, you can seek additional guidance from your close professors and collaborators.

// %https://www.edsurge.com/news/2018-05-18-how-cornell-university-diversified-its-incoming-phd-computer-science-student-body

// %https://academia.stackexchange.com/questions/130591/is-it-standard-for-us-based-universities-to-consider-the-ethnicity-of-an-applica

// %https://www.cs.cornell.edu/~bindel/paper/diversity.pdf

// %https://cs.brown.edu/degrees/doctoral/applications/helpful-resources-applying-computer-science-phd-programs/

// === Vetting a Potential Advisor and Lab (Red Flags) <sec:vetting-advisor>

// #draftbanner(note: "This overlaps a bit with my advising.pdf---cross-ref it. Be careful with tone. Maybe ask others for a remark-block here too.")

// I have spent much of this chapter on how to _find_ and _attract_ an advisor (@sec:finding-advisor, @sec:contact). But choosing an advisor is a two-way decision, and your advisor is the single biggest factor in whether your PhD is productive and bearable (@sec:visit-days). A famous advisor or a top-ranked school (@chap:rankings) does not protect you from a bad _fit_. So before you commit---ideally during visit days (@sec:visit-days), but even while building your list---do some due diligence.

// #paragraph[Talk to current and former students][This is the most reliable signal, far more so than the advisor's own pitch. Current students know what the day-to-day is really like; former students (check the advisor's website for their "alumni" or "past students") know how it ended. If you can, ask them privately:
// - Would you choose this advisor again?
// - How hands-on or hands-off are they, and does that match what you need (@chap:choosing-advisor)?
// - How often do students publish, and how long do they take to graduate (@sec:time)?
// - Is funding stable (@chap:funding)?
// ]

// #paragraph[Look at the track record][Public information tells you a lot before you ever talk to anyone:
// - *Graduation and placement.* Does the advisor actually _graduate_ students, and where do they end up (faculty, industry research, elsewhere)? An advisor with no graduates yet is not necessarily bad---new faculty (@sec:tenure-vs-tenure-track) can be excellent and hungry---but it is something to weigh.
// - *Publication pattern.* Are students _first authors_ on papers in good venues (@sec:pubs-top-tier), or does the advisor's name dominate while students stay buried in the author list?
// - *Group size.* A very large group may mean little direct attention; a very small one may mean less peer support. Neither is wrong, but know what you are signing up for.
// ]

// #paragraph[Warning signs][None of these is automatically disqualifying, but several together should give you pause:
// - Students consistently take far longer than the norm to graduate (@sec:time), or many leave without finishing.
// - You hear (carefully, between the lines) that the advisor is unavailable, takes credit, or is hard to work with.
// - Funding is precarious or the offer terms are vague (@sec:offer-letters)---always confirm funding in writing.
// - The advisor is on the verge of moving institutions, retiring, or going on long leave, with no plan for you.
// - During your own interactions, they are dismissive or evasive when you ask reasonable questions.
// ]

// #tip-block[You can read more about what to look for in an advisor's _advising style_ in my #link("https://roars.dev/phd-cs-us/advising.pdf")[advising guide]. The key mindset shift: once you are admitted, _you_ are interviewing _them_ (@sec:visit-days). Asking thoughtful questions about advising, funding, and expectations does not make you look ungrateful---it makes you look like someone who takes the commitment seriously.]

// #caution-block[Be diplomatic and discreet when asking around. The CS research community in any given area is small, and word travels. Frame questions as "what is it like to work with X?" rather than "is X a bad advisor?" You are gathering information, not collecting gossip.]

#pagebreak()


#counter(heading).update(0)

#set heading(
  numbering: "A.1",
  supplement: "Appendix",
)



// = Glossary and Acronyms <chap:glossary>
// \printglossary

// \printglossary[type=\acronymtype]

// \glsaddallunused

// \newpage
// \begin{description}


//   \item [Deferred Admission] An option allowing admitted students to postpone their start date, typically by one year.
  
// \end{description}

// %T10,T20,T50,TX

= Visa for International Students <chap:visa>

#simpsons[I didn't do it. Nobody saw me do it. You can't prove anything!"]

// % % \begin{center}
// % %     \includegraphics[scale=0.8]{files/visa.pdf}
// % % \end{center}
#figure(
  image("files/visa.pdf", width: 100%),
  caption: [#gls("F-1") student visa process.  Source: #link("https://phdcomics.com")[PhD Comics] (© Jorge Cham).],
) <fig:visa>

The #gls("F-1", first:true) is the main visa used for full-time study at an accredited US institution. Here are the restrictions that matter most to a PhD student:

- *Employment:* You are allowed to work on-campus for up to *20 hours per week during the #gls("AY")* (because you still need to take classes) and *full-time* (typically 40 hrs) during official school breaks (e.g., summer and winter breaks). Off-campus employment, such as internship, requires authorization, which can be obtained through CPT and OPT programs described below.

- *Curricular Practical Training (CPT):* CPT allows you to participate in internships or practical training that is an integral part of your academic curriculum. CPT must be related to your field of study and can be full-time or part-time. It requires prior authorization from your university and must be completed before graduation.

- *Optional Practical Training (OPT):* OPT provides up to 12 months of work authorization for students before or after completing their degree. For students in STEM fields, there is an additional 24-month extension available. OPT requires prior application and approval from USCIS.

- *Full-time Enrollment:* You must maintain full-time enrollment status during the #gls("AY", first: false). This means taking a minimum number of credits each semester, as defined by your program. Dropping below full-time status can result in loss of visa status.



== For Spouses and Children

The spouses and children of F-1 visa holders can enter the US under the F-2 visa status. The F-2 visa allows family members to live in the US with the following conditions:

For spouse:

- *Work Restrictions:* F-2 spouses are not permitted to work in the US.
- *Education:* They can study part-time but cannot enroll in full-time degree programs.

For children:

- *Education:* F-2 children can attend K-12 schools but cannot pursue higher education full-time.
- *Work Restrictions:* Like F-2 spouses, children are not allowed to work under any circumstances.
F-2 visa holders must leave the US if the primary F-1 student visa holder loses status or completes their program.


== Visa Documents and Interview

#emph-block[
This section was contributed by Hediyeh Savari, who kindly shared her experience and advice on how to prepare for the visa interview (🙏, and if you have any to share, please do).
]


Most F-1 applicants attend an in-person interview, though procedures and waiver eligibility can change. Treat your embassy's instructions as authoritative. The summary below explains the major forms and decisions; it is not a substitute for the current #link("https://travel.state.gov/content/travel/en/us-visas/study/student-visa.html")[Department of State instructions] or the website of the embassy where you apply.

=== Forms

- *Form I-20:* Your university issues this after admission and verification of funding. Follow its international-student office instructions, provide any requested financial proof, and sign the form before the interview.
- *I-901 SEVIS fee:* Use the SEVIS ID on the I-20 to pay the current fee through the official #link("https://www.fmjfee.com/")[I-901 website], then retain the receipt.
- *Form DS-160:* Complete the online nonimmigrant-visa application through #link("https://ceac.state.gov/genniv/")[CEAC]. Save the confirmation page and barcode needed to schedule the interview.

#tip-block[One option you have regarding your SEVIS ID is that, if you change your mind about the PhD program you want to join and decide to attend another program, you can transfer the SEVIS ID to the new program within a one-year timeframe, free of charge.]

=== Visa Appointment Scheduling Confirmation
Schedule your interview in your country of nationality or residence. If routine nonimmigrant visa operations are unavailable there, use the Department of State's current #link("https://travel.state.gov/content/travel/en/News/visas-news/adjudicating-niv-applicants-in-their-country-of-residence.html")[designated-post guidance]. I deliberately do not reproduce the country-by-country table here because it can change; check the official page immediately before scheduling. The relevant embassy website will direct you to its appointment service, which may be #link("https://www.ustraveldocs.com/")[USTravelDocs] or another provider.

#warning-block[You should check the #link("https://travel.state.gov/content/travel/en/News/visas-news/suspension-of-visa-issuance-to-foreign-nationals-to-protect-the-security-of-the-united-states.html")[
 U.S. Department of State website] to see whether there are any entry restrictions or travel bans for citizens of your country that would prevent you from obtaining the visa.
]

#paragraph[MRV Fee Payment Confirmation][
Now that you have created an account on 
the #link("https://www.ustraveldocs.com/")[USTravelDocs website], you can select the visa type you are applying for and the number of applicants accompanying you. Then you must pay the MRV fee of \$185. Visa application fees are non-refundable and non-transferable. You can use this fee to schedule an appointment within one year of the payment date. After this payment, you can access the calendar, choose your preferred date and time, and book your visa interview appointment.]

#tip-block[You can reschedule your appointment a limited number of times for free.]

=== Documents to Bring to the Interview

#caution-block[The #link("https://travel.state.gov/content/travel/en/us-visas/study/student-visa.html")[U.S. Department of State's standard list] of required F-1 interview documents includes your passport, DS-160 confirmation page, fee receipt when applicable, photo, and Form I-20. A consular officer or a specific embassy may request additional documents. The admission letter, funding evidence, research plan, SOP, and CV materials below are useful supporting documents, but they are not universal requirements. Always follow the instructions published by the embassy or consulate where you will apply.]

#paragraph[Admission and funding][Bring your admission letter and evidence showing how tuition and living expenses will be paid. Your funding letter may be sufficient for a fully funded PhD; self-funded or partially funded applicants and those bringing dependents may need additional financial evidence.]

#paragraph[Research Plan][
Some applicants, particularly those whose work involves sensitive scientific or technical fields, may be asked to provide a research plan or a letter from their U.S. academic advisor. If your embassy or consular officer requests one, it may need to:
- Explain the goals of your research and any practical applications;
- Identify the lab or center in which the research will take place and describe what you will have access to in the university lab;
- State the sources and amounts of any U.S. government funding (or funding from U.S. corporations assisting the U.S. government) that will support the research; and
- Describe any export-controlled technology or information that will be shared with you.

If requested, ask the embassy and your university whether the letter must be printed on university letterhead and signed by your academic advisor.
]

#paragraph[Academic and research material][Your SOP and applicant CV can help explain your academic history, employment, projects, and publications. Some posts may also request your intended advisor's CV or publication list. Bring these when the post requests them or when they clarify your proposed work; they are not universal core documents.]

#paragraph[Passport and photo][Bring a passport valid for at least six months beyond your intended stay unless a #link("https://www.cbp.gov/document/bulletins/six-month-validity-update")[country-specific agreement] provides an exception, plus any passport containing your most recent U.S. visa. Follow the Department of State #link("https://travel.state.gov/content/travel/en/us-visas/visa-information-resources/photos.html")[photo requirements].]

#paragraph[Other supporting documents][Depending on your case and post, useful material may include transcripts and diplomas, evidence of financial support, and evidence concerning your plans and ties outside the US. If another person sponsors you, the post may ask for proof of the relationship and the sponsor's finances. Bring originals and translations when instructed, but do not assume that carrying a mountain of paper can compensate for unclear or inconsistent interview answers.]

#paragraph[For dependents][Follow the post's F-2 instructions and bring evidence of your relationship, such as marriage and birth certificates. Dependents applying later should generally bring copies of the F-1 student's passport and visa in addition to their own required documents.]

=== The Visa Interview
Arrive at the embassy/consulate 15 minutes before your scheduled time. The embassy/consulate environment is calm and formal, similar to a bank. There are several counters, with officers at each interviewing applicants. Translators are also present beside each officer in case an applicant cannot speak English. However, as a prospective PhD student at a U.S. university, you are expected to speak English. So, it is highly recommended to do the interview in English. The questions in the interview vary based on your specific case, but here are some general ones you can expect:
-	What is the purpose of your travel to the U.S.?
-	What kind of research have you done in your previous studies?
-	What kind of research are you going to do during your PhD?
-	How many universities did you apply to? How many admissions have you received?
-	Why do you want to study in this particular program?
-	Have you applied to PhD programs at other universities or in other countries?
-	There is an N-year gap since your last degree. What have you done after your last graduation?
-	How will this program help you with your future career?
-	What is your plan after PhD graduation?
-	Do you have any family members or relatives in the U.S.? 
-	Have you had any international travel? Which countries? What were the purposes of these travels?

Give concise, complete, and to-the-point answers. Your answers should demonstrate seriousness, preparation, and language proficiency. Speak confidently and naturally, and avoid sounding memorized or robotic. If you have practiced interview questions with a friend or AI tools, avoid giving the officer pre-prepared speeches or scripted responses. An officer can easily detect memorized responses, and doing so has a negative effect on the impression you make during the interview. If you are a non-native English speaker, do not try to impress the officer by memorizing advanced vocabulary or complex phrases that you would not normally use. Instead, speak in your own words and at your natural level of English proficiency. Doing so will make you sound more genuine and credible.

#tip-block[While there is no official dress code, your appearance and demeanor should be consistent with your status as a student.
]

=== Outcome of the Visa Interview
There are only two possible outcomes for a U.S. visa application. The consular officer will either issue or refuse the visa.
Regardless of the outcome of your visa interview, you can always check your visa status #link("https://ceac.state.gov/CEACStatTracker/Status.aspx?App=NIV")[
  here].

#paragraph[Approval][
The officer might say your visa is approved and give you a paper that shows the outcome of your interview. He/she will keep your passport to process and issue your visa, and say they will notify you by email so you can pick it up in a few days.
]

#paragraph[Refusal][
If the consular officer finds you are not eligible to receive an F-1 visa, your visa application will be denied (refused), and you will be provided a reason for the denial. There are many reasons a visa applicant could be found ineligible for a visa. These reasons, called ineligibilities, are listed in the Immigration and Nationality Act (INA) and other immigration laws. Here are the common ones:
]

+ INA section 221(g): A visa denial under section 221(g) of the INA means that the consular officer did not have all of the information required to conclude that you are eligible to receive a visa. This means you are not eligible for the visa now, for one of two reasons: missing documents and/or administrative processing.
  + Your application is incomplete and/or further documentation is required:  Applicants whose application forms or other documentation are incomplete are refused. If further documents are required to complete your case, you will be informed what is needed and how to provide it to the embassy/consulate. You will also be given a letter stating your application has been denied under 221(g) and listing which documents you need to provide.

    If your application was denied because documentation or information is missing, you can provide the missing documents or information as soon as possible. After submitting the documentation, your visa application can then be re-assessed to determine whether you qualify for a visa. You have one year from the date you were refused a visa to submit the additional information. Otherwise, if you do not provide the required additional information within one year, you must reapply for the visa and pay another application fee.
  + Administrative processing: The consular officer could not conclude that you were eligible for the visa sought, and additional administrative processing of your application is required. You will be given a letter stating this; the embassy/consulate will contact you when the administrative processing is complete.

    If your application requires further administrative processing, this takes additional time after your interview. Processing times can vary based on individual circumstances. It is possible that a consular officer will reconsider a visa application refused under 221(g) at a later date, based on additional information or upon the resolution of administrative processing, and determine that the applicant is eligible.  

+ INA section 214(b)
  If you are refused a visa under section 214(b), it means that you:
  +	Did not sufficiently demonstrate to the consular officer that you qualify for the F-1 visa; and/or
  +	Did not overcome the presumption of immigrant intent by sufficiently demonstrating that you have strong ties to your home country that will compel you to leave the U.S. at the end of your temporary stay.

    A refusal or ineligibility under section 214(b) is not permanent and is for that specific application. There is no appeal process. After being found ineligible for a visa, you may reapply in the future. To reapply, you must complete a new DS-160 form, pay another MRV fee, and schedule an appointment for a new interview. You will not need to pay the SEVIS fee again. In your new visa application, you should be able to present evidence of significant changes in circumstances since your last application.

For more information about visa denial, visit the 
  #link("https://travel.state.gov/content/travel/en/us-visas/visa-information-resources/visa-denials.html")[U.S. Department of State visa denials webpage].

=== Details of Visa Stamp
When your visa is issued and attached to your passport, you can see some personal details. The key ones are: entries, issue date, and expiration date.

#figure(
image("files/visa-stamp.jpg", width: 70%), 
  caption: [A U.S. visa stamp #link("https://travel.state.gov/content/travel/en/us-visas/visa-information-resources/frequently-asked-questions/what-is-us-visa.html")[[Reference]]]
)
\

#paragraph[Entries][
When your visa is issued, check the "Entries" field on your visa. If it contains a specific number, you can enter the U.S. that many times using this visa. After you have used all permitted entries, you must reapply for a new visa to enter the U.S. again. If the "Entries" field is marked "M", you can enter the U.S. as many times as you want until the visa's expiration date.
]

#paragraph[Timeframe of your first entry to the U.S. with the F-1 visa][
You can receive your F-1 visa up to 365 days before your program's start date. Any date between the issue date and the expiration date listed on your visa is valid for travel to the U.S. However, your I-20 form shows the earliest admission date, which is one month before the start date of your program. Therefore, you can only enter the U.S. after that date with the F-1 visa. If you want your first entry into the U.S. on an F-1 visa to be after your program's start date, you need to ask your university for late-arrival permission. Without a late-arrival arrangement, the Customs and Border Protection officer at the port of entry may deny your admission.
]

#tip-block[Before you travel to the U.S., you might want to check the #link("https://www.cbp.gov/travel/us-citizens/know-before-you-go/prohibited-and-restricted-items")[U.S. Customs and Border Protection (CBP) website] to find out which items you can bring and to make sure they are not prohibited or restricted.]


=== General Information on Visa Issuance Statistics
The U.S. Department of State publishes monthly statistics on nonimmigrant visa issuance by nationality and by post
#link("https://travel.state.gov/content/travel/en/legal/visa-law0/visa-statistics/nonimmigrant-visa-statistics/monthly-nonimmigrant-visa-issuances.html")[here]. For example, the September 2025 data by nationality is available 
#link("https://travel.state.gov/content/dam/visas/Statistics/Non-Immigrant-Statistics/MonthlyNIVIssuances/SEPTEMBER%202025%20-%20NIV%20Issuances%20by%20Nationality%20and%20Visa%20Class.pdf")[here], and the data by post for the same month is available
#link("https://travel.state.gov/content/dam/visas/Statistics/Non-Immigrant-Statistics/MonthlyNIVIssuances/SEPTEMBER%202025%20-%20NIV%20Issuances%20by%20Post%20and%20Visa%20Class.pdf")[here]. You can check them out to get a sense of the trend.



#pagebreak()
= Domestic Students <chap:domestic-students>
//#chapter-opener([Specific benefits and opportunities for domestic students applying to CS PhD programs.])

#simpsons[I'm not a bad guy! I work hard, and I love my kids. So why should I spend half my Sunday hearing about how I'm going to Hell?]

Most of what is written in this handbook applies to both international and domestic students (the #gls("international-domestic", first:true) distinction here simply comes down to whether you require a visa to study in the US).
However, there are some differences and benefits that domestic students should be aware of and can leverage to improve their chances of admission.

#strong[Standing Out @sec:stand-out.] There are #emph[few] domestic applications compared to international ones (one reason is that many domestic students go to the workforce after their undergraduate degree). Many US universities thus want to increase the number of domestic students in their programs. So if you're a domestic student, you already #emph[stand out] from the crowd.

#strong[Fee Waiving @sec:fee-waive.] Some schools might offer application fee waivers for domestic students. You should check with the school you're applying to.

#strong[School @chap:your-school.] Adcom already knows about your school, which is a plus (so that we do not have to spend time evaluating your school and its curriculum). 
You are also more familiar with the US education system and academic culture (@chap:cultural). 


#strong[Transcripts.] You do not need to get your transcripts evaluated or translated (which can be a hassle and inaccurate). You can just send your official transcripts directly to the school you're applying to.

#strong[Standard and English Tests @chap:standard-tests.] You do not need to take TOEFL or IELTS (@sec:english-tests) because you already did your undergrad (or MS) at a US university. You likely have better English skills, which can help you in writing your SOP and communicating with professors (@sec:contact).


#strong[Funding @chap:funding.] You have more opportunities for funding, e.g., through government scholarships for US citizens and permanent residents. You can also apply to specific programs #emph[before] you start your PhD, e.g., NSF #gls("GRFP"), DoD NDSEG and Hertz Foundation Fellowship. These fellowships are very competitive (@chap:fellowships) and can significantly improve your admission chances.

#strong[Research Experience @chap:research-opportunities.] You might have many opportunities to do research as an undergraduate, e.g., through #gls("REU") programs and internships at your undergrad university. Highlight such experience in your application.

#strong[Open House @chap:accepted.] It is easier for you to attend open house events in person. This can help you make a better decision on which school to attend.

// % \begin{domesticbox}[Domestic students:] If you're a domestic student, you have several advantages in your application.   You also have more opportunities for funding, e.g., through government scholarships for US citizens and residents. Finally,
// % \end{domesticbox}

#pagebreak()
= MS Admission <chap:ms>
//#chapter-opener([MS focuses on coursework and prepares you for *industry*, while PhD focuses on research and prepares you for academia or research. So admission requirements are different.])

While both MS and PhD programs are graduate degrees, they are _very different_ in terms of objective, admission requirements, course requirements, duration, and funding. This section discusses the differences and provides guidance on applying to MS programs.

== Differences between PhD and MS <sec:phd-vs-ms>

#definition-box[MS vs. PhD][An MS is a #highlight[coursework degree]: typically 2 years, usually _not_ funded (@sec:ms-funding), and prepares you for industry. A PhD is a #highlight[research degree]: 5--7 years, funded (@chap:funding), and prepares you for research careers (@sec:worth-it).]

#figure(
  caption: [MS vs. PhD],
  table(
    columns: 3,
    align: left,
    stroke: none,
    table.header(
      [], [*MS*], [*PhD* (@sec:worth-it)],
    ),
    table.hline(),
    [Objective], [Industry], [Research],
    [Admission Req], [No research experience], [Research experience],
    [Coursework Req], [Yes], [Yes (but research is much more important)],
    [Duration], [2 years], [5--7 years],
    [Advisor Req], [No], [Yes],
    [Funding], [No], [Yes],
    table.hline()
  ),
) <tab:phd-vs-ms>

@tab:phd-vs-ms summarizes the main differences between MS and PhD programs:

- *Objective:* an MS is typically to prepare you for #emph[industry], while a PhD is to prepare you for research and academia (@sec:worth-it). Some MS has thesis option but in general research is not a focus in MS programs.

- *Admission requirements* (@sec:ms-admission): MS also requires a good GPA, LORs, SOP, and test scores, but research experience is not required. PhD requires all of these, but research experience is a must.

- *Course requirements:* MS has a specific number of courses that typically can be done in 2 years. You graduate with an MS when you're done with the courses. PhD also has coursework requirements, which are typically taken in your first 2 years (@sec:time). However, after (and also during) coursework, you focus mainly on research. You graduate with a PhD when you have done enough research and written a dissertation, which usually takes much longer time than coursework.

- *Duration:* an MS typically takes 2 years while a PhD takes 5--7 years (or even longer). Many students get an MS along the way to a PhD, e.g., after finishing the 2-year course work.

- *Advisor:* MS students typically do not have an advisor (if you do thesis option then you will have one), while PhD students need an advisor who guides them in their research.

- *Funding:* MS is typically #emph[not funded], while PhD is (@chap:funding). See @sec:ms-funding for more details on MS funding.

== MS Admission <sec:ms-admission>

In most cases MS CS programs are much less competitive than PhD programs, i.e., you're likely to get in if you can afford it. Many think of MS programs as a _cash cow_ because students are often not funded and have to pay tuition. 

While admission requirements are similar to PhD programs (e.g., GPA, SOP, LORs), research is not a focus in MS programs. Often, the main requirements are just that you have sufficient background in CS, e.g., through your undergrad degree. This does not mean MS programs are easy to get admitted, but the requirements are much lower compared to PhD programs.

=== MS Admission Committee <sec:ms-adcom>

MS admission also involves an adcom that reviews applications and makes admission decisions. However, MS admission is typically #gls("rolling admission", display: "rolling")---applications are reviewed as they come in---and decisions are made throughout the admission cycle.  

Moreover, unlike PhD that has multiple reviewers for each application, an MS application typically involves only one reviewer and does not require much time to review compared to a PhD application (@sec:ievaluate). 

Finally, MS adcom can involve teaching faculty (@sec:faculty-types), who are not necessarily doing research. This is because MS programs are often geared towards working professionals and do not focus on research.

#note-block[
  GMU has a large number of MS students in CS (800 MS vs 200 PhDs). In contrast, other similar size universities often have much smaller MS CS programs (or none). Location plays an important role as GMU is close to DC with many developer professionals who want to get an MS, which are often covered by their employers. Our MS program is geared towards working professionals, e.g., all of our MS courses are offered in the evening and online.
  
  GMU CS has three separate committees for MS admission: MS in CS (the traditional one, which is the largest), MS in Software Engineering (SWE), and MS in Information System. Each committee has its own chair and members. For example, I often serve in the MS SWE adcom, which has about 4 adcom members (including the chair who also does the review).
]

=== MS Application Materials <sec:ms-application>

You will submit similar materials as in a PhD application, e.g., transcripts, #glspl("LOR"), #gls("SOP"), and test scores. However, research experience is not required, and LORs can be from anyone who can speak about your academic or working abilities. Moreover, your SOP should focus on your academic and work background, why you want to get an MS, and how the program fits your goals. As with PhDs, GREs are often not required. Some MS programs do not even require LORs or SOPs.  

- *Undergrad Background and GPA:* Since research is not required, your undergrad background is more important in an MS application. You should have a strong background in CS, e.g., through your undergrad degree. GPA is also important, as it is often used as a filter for MS applications.

- *SOP:* Your SOP should explain why you want to get an MS, how the program fits your goals, and why you're a good fit for the program. You don't need to mention working with specific professors unless you want to do a thesis option. You still need to customize it for each school (e.g., you picked GMU due to its strong SWE program or the DC area has many job opportunities).

- *LORs:* Unlike PhDs, your LORs do not need to be from professors or talk about research experience. Many MS programs do not even require LORs.

- *Test Scores:* Unlike PhDs, which often do not require #gls("GRE"), MS programs often do. However, some schools do make them optional, and you should check with the school you're applying to. If you have a low GPA, a high GRE score can help offset that. 

As with PhD, English proficiency tests (TOEFL/IELTS) are required for international students (but just passing the minimum requirement is often enough @sec:english-tests). Note that just as with PhD, English tests are waived if you did your undergrad at a US university.


== Funding (Why MS Students Are Typically Not Funded?) <sec:ms-funding>

Unlike PhD programs, which often have funding (@chap:funding), MS students are typically _not_ funded. This is because MS students do not focus on research and thus are not funded through RA and PhD students have priority for TA positions. 

- *RA*: Profs. are not willing to take MS students as RAs because they are not around long enough to be productive. It can take a while for a student to get used to research and start being productive, and by that time (1--2 years), they are about to graduate. Moreover, the goal of most MS students is to get a job, not to do research, so they are not as motivated to do research.

- *TA*: MS students are typically not given TA positions because PhDs are given priority as they will stay much longer (@sec:time). Many depts. do not have enough TAs for PhD students and so they cannot afford to give them to MS students.

#note-block[While MS students are typically not funded and do not focus on research, there are always exceptions.
Some MS programs are fully funded, e.g., those that are research-oriented and have a strong research component.
Moreover, some schools have TAs for MS students, and you can apply for these positions. For example, GMU CS has quite a few TAs for MS students, and my courses in the past two years have MS TAs.

Finally, if you have a strong background and can demonstrate that you can be productive in research, then a prof. might be willing to take you as their RA.  Some of these students convert to PhD students after having this research experience.
]


== Selecting and Ranking Schools <sec:selecting-ranking-schools-ms>
// \sectioninfo{How to select and rank MS programs in CS.}

Because of the differences between MS and PhD programs (@sec:phd-vs-ms), you should consider different factors when selecting and ranking MS programs (see @chap:choosing-school for selecting PhD programs). For example, you might want to consider factors such as location, industry connections, and job placement instead of research areas and advisors (@chap:choosing-advisor).

- *Location:* In addition to living in a place you like (e.g., warm weather, historical city, etc.), you should also consider the job opportunities in the area. For tech industry, consider MS programs in tech hubs like the Bay Area and Seattle. For government jobs, look at schools in the DC area. For example, many students at GMU work for the government or defense contractors in the DC area and take classes in the evening or online.

- *Industry Connections:* Universities often have strong connections with local companies and can help you get internships and jobs. For example, Microsoft and Amazon look for students in the Washington area while Google and Facebook recruit those in the Bay Area. Due to its location, GMU students naturally get jobs from the government, defense contractors, and Amazon, whose 2nd HQ is in Arlington.

- *Ranking:* Unlike PhD programs where the advisor and research are likely the most important factor, in MS programs the ranking of the school is typically more important. Thus, you should consider the ranking of the school in CS, especially in the specific area you're interested in. For example, if you're interested in software engineering, you might want to consider schools with strong SWE programs.

- *Living Cost:* MS students are typically not funded (@sec:ms-funding), so living cost can be a big factor. You should consider the tuition---including #gls("in-out-state", first:true) tuition differences at public universities---and living expenses of the area. Note that sometimes living costs, e.g., renting, seem scary at first but students often find way to make it work, e.g., by sharing an apartment with other students.

#pagebreak()
= Research Opportunities <chap:research-opportunities>
//#chapter-opener([How to get research experience as an undergrad.])

#simpsons[Kids, you tried your best and you failed miserably. The lesson is: never try.]

#figure(
  image("files/phd100404s.png", width: 70%),
  caption: [Source: #link("https://phdcomics.com")[PhD Comics] (© Jorge Cham).],
)
Research experience gives you opportunities to try out research, determine what research area you're interested in, publish papers (@chap:research-experience), connect with researchers, and get strong LORs (@chap:LOR).
A successful research experience also greatly strengthens a PhD application (@chap:research-experience). This section provides some guidance on how to gain research experience as an undergraduate (or MS) student or as a student at a smaller college where research opportunities might be limited.

== Locally 

Start looking for research opportunities at your institution.
If you did well or liked a class, you can check with the professor of that class for research opportunities.
You can also go to the department directory and then professors' websites and see if they are looking for undergraduate researchers.
Even if they say they are looking for graduate students, you can still contact them and ask.

Many universities have programs to encourage undergraduate research. For example, GMU has the OSCAR program, UNL has UCARE, and #gls("NSF") has #gls("REU")'s (for US citizens and permanent residents).

You can also take honor thesis or independent study courses with a professor.  This is a good way to get research experience and also get a LOR from the professor.  You can also ask your academic advisor or other faculty members for suggestions.  Finally, you can also ask your peers who are already doing research.  Use the method described in @sec:contact to contact professors

#example-box[
    I enjoy working with undergrads and actively recruit them to my #link("https://roars.dev")[research group].
    I get undergraduates through my classes, e.g., asking students who did well in my class if they are interested in research.
    Occasionally I was introduced to students by other students or faculty (though I did not have much success with this method).
    
    Several times I found students by accident. For example, _Stefania_ came to my office for advising and her volunteer work caught my attention; I found out about _KimHao_ because he participated (and placed highly) in an ACM competition, and _Azan_'s vibe-code webapp that aims to replace RateMyProfessors both amused and impressed me.
     
  While most undergrads are understandably not productive in research, some are and I have published multiple papers with them---like with Kimhao and Stefania.  
I also have written LORs for them and have helped them get into good PhD programs.
]

== Open Source Contributions <sec:open-source-contribs>

Open development platforms such as GitHub offer many research opportunities.
In CS and many other fields, research labs often put their projects on GitHub to encourage collaboration and contributions from the community. For example, my research group, #link("https://roars.dev/")[Roars], has many open-source projects that undergrads can contribute to (some of my undergrad actually created and maintain these projects, e.g., #link("https://cspicks.roars.dev")[CSPicks]).

By contributing code, fixing bugs, implementing new features, or providing documentation, students can gain practical research experience and interact with experienced developers and researchers in the field. Not only you gain research experience, but you might be able to get a LOR from the project maintainer, and you should write about this experience in your SOP (@chap:sop)

== Virtual Research Opportunities 
This is less common but several places offer virtual internships and research programs aimed at providing hands-on research experience. These programs often involve working remotely under the guidance of experienced mentors and collaborating with a team of fellow researchers. For instance, #link("https://docs.google.com/forms/d/1btIwt4HwjyKMOUk-EMy3rbkfWzFxv2lNrMm_zkd0pA4/viewform?edit_requested=true")[UIUC+ Summer Undergraduate Research in Software Engineering] offers an unpaid remote internship for software engineering students all over the world to collaborate with mentors from University of Illinois at Urbana Champaign.

// % \paragraph{Online Conferences and Workshops}: Attending online conferences and workshops is another way to gain exposure to cutting-edge research and establish connections with experts in the field. Many conferences now provide virtual participation options, enabling students to access research talks, poster sessions, and panel discussions and sometimes access designated chat rooms or networking events where participants can engage with researchers, ask questions, and seek potential research collaborations. By creating profiles, joining relevant research groups, and participating in discussions, students can connect with established researchers, contribute to ongoing projects, and potentially collaborate on publications or research proposals as they provide access

// % = Publication Authorship <chap:authorship}
// % \chapterinfo{How authorship is determined in research papers.}

// % Having a publication shows your research potential and can significantly improve your admission chances (\autoref{sec:publications}). Moreover, LOR writers often refer to your publications to support their claims about your research abilities (\autoref{chap:LOR}). Likewise, you should also describe your work that has been published in your SOP (\autoref{chap:sop}).  Of course all of these are only true if you are a significant contributor to the work.

// % New researchers, especially students, often have questions about contributions and authorship, which arguably is one of the most sensitive and important aspects of academic publishing.   If not handled properly, disputes over authorship can lead to misunderstandings and conflicts, changing from a positive experience to a negative one and damaging reputations and relationships.



// % \section{Contributions in the Work}
// % A  typical CS research project involves the following tasks leading to a publication:
// % \begin{itemize}
// %   \item \textbf{Idea}: This involves identifying a research problem, knowing the related work, and proposing a solution or approach.  For most new researchers, this part is often done by the advisor or senior researchers. For example, your mentor suggests a problem to work on and ask you to try some specific approach.  Typicaly the problem and approach are vague and you need to refine them, e.g., by reading more related work and trying out different ideas.

// %   \item \textbf{Implementation}: This involves implementing the proposed approach.  You might need to try different methods, algorithms, data structures, and optimizations to make the prototype work.  In system fields such as software, implementation involves coding and building a prototype.  In other fields, such as theory, it might involve developing mathematical models and proving theorems.  In other fields, such as HCI, it might involve user studies and qualitative analysis. Regardless, this part is often the most time-consuming and challenging part of the work.

// %   The person doing the implementation understand the most about the approach and its strengths and weaknesses.  It is very rare that the mentor or advisor would get involved in the implementation as they often want to manage at a high level and give the student freedom to explore and learn.  The student would regularly update the mentor on the progress and discuss any issues.  The mentor would provide high-level guidance, e.g., suggesting different algorithms or optimizations to try, but would not do the implementation themselves.

// %   \item \textbf{Evaluation}: Once implementation is done (often determined by the advisor), you need to design the experiments to evaluate the approach.  This involves forming research questions and hypotheses (e.g., does the approach improve performance? how does it compare to the state-of-the-art?).  These research questions then determine how the experiments are designed, e.g., what datasets to use, what baselines to compare against, what metrics to measure.

// %   This part is often shared by both the student and the advisor, where the advisor provides high-level guidance and the student does the details.  Moreover, this part often requires multiple iterations, e.g., the initial experiments might not work well and you need to refine the research questions and experiment design.

// %   \item \textbf{Collecting and Analyzing data}: This involves running the experiments, collecting data, and analyzing the results.  This part is often done by the student, who needs to ensure that the experiments are run correctly and the data is collected accurately.  The student also needs to analyze the data and draw conclusions from the results.

// %   In most cases, the student doing the implementation would also do this part, as they understand the approach and its strengths and weaknesses the most, and can easily update the implementation and refine the experiments as needed.  Like the implementation part, the advisor does not get involved in this part but would provide high-level guidance and discuss the results with the student.  In many projects, this part also involve other people, e.g., undergraduate students, who help run the experiments and collect data.


// %   \item \textbf{Writing}: Once you get promising experimental results, your advisor would ask you to write a draft of the paper to a target conference or journal (this helps determine the format and audience of the work).
// %   Writing is often the hardest part for new researchers as it requires a different skill set (e.g., you could be very good with technical work but not good at writing). You can learn from looking at other papers, e.g., from your own group and other papers published in the target conference or journal.

// %   In most cases, the student would provide the first draft of the manuscript.  Other contributors, e.g., those who helped with the experiments, might also contribute to the writing, e.g., by writing specific sections and give feedback on the draft.

// %   Once a draft is ready, the student would share it with the advisor and co-authors for feedback.  This part is often done through multiple iterations, where the student revises the draft based on feedback from the advisor and co-authors. In many cases, during the writing process the student might find issues with the approach and experiments, and need to go back to the implementation and experiment design parts to refine them.


// % \end{itemize}


// % After the manuscript is ready, it is time to submit the work. At this point the author list and order should be finalized! In most cases the venue would not allow changes to the author list after submission.  While there are other parts involved, e.g., rebuttal or response to reviewers' comments, and revisions, these should not affect the author list and order.  Note that for journal where significant revisions are often needed (or a conference paper being rejected and resubmit), the author list and order can be changed during the revision process, e.g., additional contributors can be added.



// % \section{Authorship Criteria and Order}

// % \paragraph{Who should be an author?} The short version: people who made significant contributions to the work should be authors.
// % Longer version below.

// % First, in CS, the number of authors is typically small, e.g., 2--5 authors.  This is unlike some other fields, e.g., biology and medicine, where the number of authors can be very large, e.g., 10--20 authors.  Thus, in CS, authorship is a big deal and should be reserved for those who made significant contributions to the work.

// % \paragraph{Order of authorship} The short version: the first author is typically the primary contributor, the last author is typically the senior author (e.g., advisor), and middle authors are ranked by level of contribution.



// % Key Questions to Ask Early

// % When planning a paper, always begin by asking two questions:
// % 	1.	Who will be an author?
// % Authorship should be reserved for those who made substantial intellectual or practical contributions to the work. The International Committee of Medical Journal Editors (ICMJE) criteria, often adopted broadly, require:
// % 	•	Significant contribution to the conception/design of the work, or to the acquisition, analysis, or interpretation of data.
// % 	•	Drafting the manuscript or critically revising it.
// % 	•	Approval of the final version.
// % 	•	Agreement to be accountable for the integrity of the work.
// % Anyone who does not meet these criteria should not be listed as an author but may be acknowledged (see below).
// % 	2.	What will the order of authors be?
// % Authorship order is rarely neutral. It signals the relative contributions of the authors, and different disciplines have different conventions. For example:
// % 	•	In many areas of Computer Science, first author indicates the primary contributor, usually the one who drafted the paper, ran the experiments, or contributed the majority of the intellectual content.
// % 	•	The last author is typically the senior author (e.g., PI, advisor, or lab head), who provided vision, leadership, and/or resources.
// % 	•	Middle authors are usually ranked by level of contribution, though in some fields (e.g., mathematics, economics), alphabetical order is the standard.
// % Papers may explicitly designate co-first authorship if two (or more) people contributed equally. If so, this should be clearly indicated in a footnote (e.g., “These authors contributed equally to this work.”).
// % In large collaborations or consortium papers, authorship may be collective (e.g., “XYZ Working Group”) with individual members listed in a supplement.

// % Authorship Practices and Pitfalls
// % 	•	Fairness and Transparency: Discuss authorship decisions early and revisit them as the project evolves. Contributions may shift, and so might the author list or order. Avoid waiting until the final draft to negotiate authorship.
// % 	•	Documentation: Keep a record of contributions. Some journals require a “contribution statement” (e.g., Author A designed the experiments, Author B ran the code, Author C wrote the draft). This reduces ambiguity and makes credit transparent.
// % 	•	Discipline-Specific Norms: Always be aware of the conventions in your field. For example, in CS and Engineering, first authorship is central; in Mathematics, alphabetical listing is common; in Biomedical Sciences, the last author carries particular prestige.

// % Acknowledgements

// % Not everyone who contributes to a project should be an author. Contributions that merit acknowledgement rather than authorship include:
// % 	•	Providing materials, data, or technical assistance.
// % 	•	Offering useful discussions or informal advice.
// % 	•	Administrative support or general lab management.
// % 	•	Funding acquisition, if the funder had no intellectual input.

// % Acknowledgements should also include funding sources and grant numbers. Failing to credit contributors properly can create resentment or ethical concerns.

// % Problematic Authorship Practices
// % 	•	Ghost authorship: When someone (often a hired professional writer) makes a substantial contribution but is not listed as an author. Common in industry-sponsored publications and considered unethical.
// % 	•	Guest or honorary authorship: When someone is listed as an author without having made significant contributions, usually to increase credibility, appease power dynamics, or curry favor. This dilutes responsibility and is equally unethical.
// % 	•	Authorship inflation: Adding excessive numbers of authors for political or strategic reasons. Some fields tolerate large teams (e.g., physics collaborations with hundreds of authors), but in smaller projects, inflated author lists can undermine credibility.

// % Special Situations
// % 	•	Disputes and Conflicts: If disagreements arise, try to resolve them internally, ideally with lab policies set in advance. If necessary, department chairs, deans, or professional guidelines can mediate.
// % 	•	Students and Mentors: Students often deserve first authorship when the work stems from their thesis or project, with advisors typically listed last. However, advisors should resist the temptation to minimize a student's contribution.
// % 	•	Cross-disciplinary Teams: Different disciplines may have conflicting norms. In such cases, negotiate a compromise and explain the order in a contribution statement.
// % 	•	Reproducibility and Responsibility: Every listed author should be willing to stand publicly behind the integrity of the work. Even middle authors bear responsibility—not just the first or last.



#pagebreak()

= Fellowship Applications <chap:fellowships>
//#chapter-opener([How fellowships such as NSF GRFP and DoD NDSEG are evaluated.])

#simpsons[You mean those leagues where parents push their kids into vicious competition to compensate for their own failed dreams of glory?]

Having an external and major fellowship can significantly relieve the financial burden of your PhD study and improve your chances of getting into a good program (@sec:fellowships). 
Among the most well-known and prestigious fellowships for CS PhD students who are US citizens or permanent residents (@chap:domestic-students) are the #gls("GRFP", first:true)  and the #gls("NDSEG", first:true). These fellowships provide multiple years of full financial support, including tuition, stipend, and health insurance.

The #link("https://www.nsfgrfp.org/")[GRFP] and #link("https://www.ndsegfellowships.org/")[NDSEG] websites have detailed information on the application process and eligibility requirements. The #link("https://www.nsf.gov/funding/information/faq-frequently-asked-questions-faqs-graduate-research-fellowship")[NSF GRFP FAQ] has many useful tips and resources. 
You can also find articles written by previous winners offering tips on writing a strong application (see the #link("https://code.roars.dev/phd-cs-us")[link] section on this book's website). However, keep in mind that while these writers were successful in securing the fellowship, they often have no insight into how their applications were actually evaluated or what the reviewers want to see.

This chapter focuses on how your application is evaluated, what reviewers look for, and tips on improving your application. Note that while these are specific GRFP and NDSEG, the given advice should be applicable to other major fellowships---including those for international students.


== NSF GRFP <sec:nsf-grfp>

The #gls("GRFP", display: "NSF GRFP") is a prestigious fellowship for US citizens, nationals, and permanent residents who are in the _early stages_ of their graduate study in STEM fields, including both MS and PhD students. The GRFP is highly competitive, with many applicants from top schools, with strong LORs and research experience. In many cases, even an _"honorable mention"_---meaning you did not get the fellowship but were considered a strong candidate---can help you get into a good PhD program (so make sure to mention it in your CV and application).

=== Evaluation

- Each applicant is assigned to _about 3 reviewers_ who have expertise in the applicant's research field (e.g., if your topic is in PL, your reviewers will likely work in PL or did their PhD in PL). This means reviewers are quite knowledgeable in your field and your work, your LOR writers and their work, and thus can evaluate your application quite in depth. This is different from PhD applications where adcom reviewers (@sec:adcom) might not be in your field.

- While reviewers are likely in your field, they might not be research-focused faculty members (e.g., tenure-line). In fact, I believe many reviewers are teaching faculty (@sec:faculty-types). So this means they may not be familiar to the latest related work or trend in the field. So make your research plan easy to understand and well-motivated (see @sec:grfp-pitfalls).

- Reviewers typically try to compare applicants _within their #gls("cohort",first:false) level_. This means that we do not compare an undergrad, who is still applying to grad school, to a 2nd year PhD student who already has an advisor and published multiple papers. This ensures that each applicant is evaluated fairly based on their level.

- Unlike CS PhD applications that focus on research potentials in which papers, research experience, and LORs are important, NSF GRFP looks at both _research potential_ and _broader impacts_, e.g., how you can help society or mentor others. It is _not expected_ that you have published papers or have a lot of research experience (recall that students applying for MS are also eligible). Instead, you need to convince the reviewers that you have the _potential_ to be a good researcher (technical merits) and that you can help society (broader impacts). More in @sec:grfp-im-bi.


=== Intellectual Merit and Broader Impacts <sec:grfp-im-bi>

Your application will be evaluated based on two criteria: Intellectual Merit (IM) and Broader Impacts (BI). 

+ *Intellectual merit (IM):* IM evaluates your research potential, e.g., your research experience, your potential to do research, and how you can contribute to the field.   Unlike a normal project or research proposal, in which the evaluation is entirely based on the merits of the proposed work, in the GRFP, the evaluation is _not_ entirely about the research plan. Reviewers are repeatedly reminded to not focus too much on the research plan as many applicants are still applying for PhD programs and might not even get into the field or work with a prof. that fit their research plan. 

  Instead, the evaluation is based on your _potential_ of being a good researcher using various criteria, e.g., your research experience, what others think of you (LORs), research plan, etc. This also means that even if you have very little research experience, you can still get the fellowship if you can convince the reviewers that you have the potential to be a good researcher.  Vice versa, if you have a lot of research experience and in very top places but cannot convince the reviewers that you have the potential to be a good researcher, you will not get the fellowship.

+ *Broader impacts (BI):* BI is a common and important component of an NSF application. It is about how you and your research can _benefit society_. Many students just mention how their research is cross-disciplinary and thus has broader impacts (e.g., improving software quality and thereby helping society). This is too common and not enough. You also want to discuss how you, as a graduate student, can help society through outreach, mentoring, and similar activities. As mentioned below, you will want to be specific and concrete, e.g., _"I will work with high school students"_ is not as convincing as _"I have experience mentoring high school students through X and will continue to do so through Y and Z."_

  Writing BI is often difficult, not only for students but also new faculty.  You should ask someone who has experience writing NSF proposals to review your BI.

=== Common Pitfalls and Tips <sec:grfp-pitfalls>

These are common pitfalls that many applicants make in their GRFP applications and tips on how to avoid them. Many of these can be avoided and fixed by asking someone who has experience writing NSF proposals to review your application.  You should also ask your LOR writers to review your research plan and SOP.  


- *Too Technical or Narrow.* Remember that you're writing to a general audience in CS.  While NSF tries to match reviewers with your field, CS is simply too broad and you might get a reviewer in your field but not in your specific area or familiar with the research topics you're working on (see meanings of fields, areas, and topics in @sec:fields-and-areas).  For example, a person working in PL might not be familiar of all its areas, e.g., program synthesis, verification, or type inference.  

  So avoid technical jargon, explain things in simple terms, and motivate your work well. If the reviewer cannot understand your research plan, they will likely give you a low score.

- *Preliminary Work.* Your research plan should have some preliminary work to convince reviewers that you have thought about the problem and have some initial results.  It does not have to a lot, e.g., you don't need published results or an implementation, a small experiment done by hand on some small examples would suffice.  Moreover, it should be concrete and convincing, e.g., _"When being applied to the program in Fig 1. of the paper published PLDI'19 that approach X failed, my proposed idea worked and was able to ..."_.  This will set you apart from others who just have a plan but no results.

- *Related Work and Challenges.* Many research plans motivate the problem well but do not discuss limitations of existing work, making it questionable if the problem is important or if you are aware of the challenges.  Thus, you should do a thorough literature review and discuss what people have done and their limitations.  Your research plan should then talk about how you plan to address these limitations, i.e., fill the gap in the literature.  

- *Do not BS.* Many research plans include technical details or proposed work that are vague, unrealistic, or even impossible. This is similar to a student taking an exam and write a lot of nonsense and hope for partial credits.  As mentioned, reviewers are often chosen based on their expertise in your field and can detect B.S. Again, do your homework and ask someone who knows the field, e.g., your advisor or LOR writer, to review your research plan. In my experience, this seems to be more common from students at top schools and have research experience, which might make think they can BS their way through the application.

- *Overexaggeration LORs.* Many GRFP applicants have ref. letters from professors that are very good at writing LORs. However, they often use flowery language and overrate their students. Reviewers can sense this overexaggeration and might not trust the LORs. This is similar to overclaiming research contributions when writing papers---so _ask your LOR writers to tone down_ their enthusiasm and be specific with concrete examples to demonstrate why you're _"the best"_.


== DoD NDSEG <sec:dod-ndseg>

The #gls("NDSEG", display: "DoD NDSEG") is another prestigious fellowship supporting *U.S. citizens* pursuing advanced degrees in STEM fields *critical to national defense* (such as CS). NDSEG has several differences from NSF GRFP, e.g., it focuses more on application to DoD and redacts more information about you and your application materials.

=== Evaluation

*Redacted info.* Unlike the NSF GRFP, reviewers only see *redacted versions* of your submitted materials (applicants are asked to provide full and redacted versions of your research plan, CV, and other materials). Thus, we do not know what schools you went to, where you did your internships, your publications or research experience. We also *do not* see your LORs, i.e., we do not know who wrote them or what they wrote!

Reviewers mainly get to know you and evaluate your application by reading your research plan and personal essays. This is for *fairness and avoiding bias* based on the school you went to, places you published at, your LOR writers, etc. Nonetheless, I felt I am missing too much information. It could be that external reviewers like myself help with the first cut based on redacted materials, and then there are internal reviewers who make the final decision based on the full materials.

*Non-expert* NDSEG reviewers hold advanced degrees in STEM fields. However, NDSEG reviewers are more general and might not be in your specific field. For example, in GRFP I mostly review applications in PL, while in NDSEG it seems that I review applications in all fields of CS and even non-CS. Thus, you should make your research plan *more accessible to a general audience*.

#example-box[
I find it a bit difficult to evaluate NDSEG applications because I do not have the full picture.  For example, a student mentioned that they have published in the topic they proposed but redacted all information about the publication, so I have no idea where they published, what the paper is about, etc.  
It is also difficult to evaluate the academic background of the student, e.g., some student just started grad school and so their transcript is essentially blank. It is also annoying to see CVs with so many blanked out and redacted information (they might as well should just submit a blank CV).

In the beginning I find it surprising that I don't even get to see the LORs, but I understand the reasoning behind it and gradually think it is a good idea. As mentioned above, LOR writers for NSF GRFP (@sec:grfp-pitfalls), especially those from top schools, often overrate their students and thus can bias the evaluation. So I don't find I am missing much by not seeing the LORs.
] <remark-ndseg>

=== Common Pitfalls and Tips <sec:ndseg-pitfalls>

These are some common pitfalls I see in NDSEG applications and tips to avoid them.  Some of these are similar to NSF GRFP (@sec:grfp-pitfalls) while some are specific to NDSEG.

- *Customize your research to DoD* by doing some research to find specific projects from DARPA or ONR and explicitly mention them---like in the introduction or in its own section.  This is different from NSF GRFP where you want broader impacts to society.

- *Unclear research plan.* You should aim to have (i) clear problem statement, (ii) why it is important (esp. to DoD), (iii) what has been done and their challenges/limitations, and (iv) what you plan to do to address the challenges.  Moreover, research is often quite technical and ambitious, so you want to show some preliminary work, e.g., a small experiment by hand on some small examples, to convince reviewers that you have thought about the problem and have some initial results.

  Unlike GRFP where we have more contents to evaluate, in NDSEG we mainly evaluate based on personally essays and especially research plan. So you should do proper research on what you propose and make it clear and convincing.

- *Personal stories and essays should be unique and interesting*. Many essays and stories I read are quite generic and do not tell much about the student. For example, involving in a robotics club or mentoring students are quite common and do not tell much.
  
  So you should pick a few thing and provide concrete examples and details.  For example, talk about what you have accomplished in your robotics club, e.g., you built a robot that won a competition.  Such small, interesting details can make your essay stand out.

- *Not using all allowed pages*. Many research plans use only 1/2 or 2/3 of the number of allowed pages, which themselves are already quite short. This often does not provide enough information for reviewers to understand and evaluate the research plan.  So use all allowed pages to provide enough details about your research plan. This is especially important as we do not know much about you due to redacted materials.


== Common Tips for Both Fellowships

- *Use LaTeX to write your research plan and essays* (@chap:writing-latex).  This is the standard in CS and the general engineering and science disciplines, and will make your application look more professional. //Moreover, do not use the default Word settings, e.g., left justification, as it is not standard in CS and engineering and difficult to read.  

- *Ask your LOR writers and advisor to look at your writing/essays* (this is very important so I keep repeating it).  You are new to the field and research writing, and your ideas might not be accurate or have already been explored. It's better that they tell you now than for you to find out later from reviewers.

- *Do not BS*. I said this before (@sec:grfp-pitfalls) and I say it again here. Many times students have some achievements (e.g., publications) and thought they know a lot and start BSing. This will greatly _annoy_ reviewers, especially experts in the field. (Un)Surprisingly I find this being more common with students from _top schools_ with strong LORs and good research experience.


== My Experience as a Reviewer

#example-box[
I enjoy reviewing the GRFP applications more than NDSEG, which redacts most applicant information as mentioned above. I can review GRFP applications more carefully because NDSEG doesn't provide much info to work with.

I also find GRFP applicants have stronger _research plans_. GRFP applicants often already have good research experience, with many having top-tier publications. They also tend to come from well-known institutions with "fancy" LORs. In contrast, NDSEG applicants come from a broader range of schools and backgrounds. Interestingly, I find the _personal statements_ in NDSEG applications more appealing, largely due to their personal stories and varied experiences.

A quick note on compensation: GRFP reviewers, like other NSF panelists, receive a modest honorarium (\$200 total; I probably spent several full days reviewing dozens of applications). NDSEG reviewers aren't officially paid, though I did receive some compensation, e.g., a \$50 American Express gift card---but for whatever reason it never worked when I tried to use it. So, not much compensation (days of reviewing and writing comments for a couple of hundred dollars), but I enjoy the experience and would do it for free anyway!
]

#pagebreak()
= Faculty Research Activities and Achievements <chap:research-achievements>
#simpsons[Homer: Oh, why won't anyone give me an award?\
Lisa Simpson: You won a Grammy.\
Homer: I mean an award that's worth winning.]

When exploring potential advisors, students often look at faculty websites to learn about their research and achievements. Common indicators of research productivity include publications and involvement in research community. However, beyond these, CS has several prestigious and meaningful achievements that researchers aim for, but that are not as well-known to prospective students. 

This chapter first looks at the common research activities and then discusses the "big" research achievements that faculty often highlight on their websites, CVs, or departmental news and awards pages (e.g., at #link("https://www.cs.washington.edu/people/honors-awards/")[UWash] and #link("https://realgmucs.github.io/awards.html")[GMU]).


== Common Research Activities <sec:common-research-indicators>

Publications and involvement in the research community are common indicators of research productivity. These are the _"bread and butter"_ of research and lacking in these areas can indicate that the faculty is not active in research.

=== Publications in Top-Tier Venues <sec:pubs-top-tier>

Publications in #gls("toptier", first:true) are the most reliable factor to measure the productivity of a faculty. They give visibility to the faculty's work and help establish their reputation in the area. For #gls("tenure-track") faculty (@sec:faculty-types), especially at top CS programs, publications at top-tier conferences and journals are often the standard for academic tenure and promotion.

*Conferences.* Unlike many STEM disciplines like Maths and Physics (@sec:fields-and-areas) that prefer journals, most CS fields focus on publishing at _conferences_. CS is very fast-moving, and journals are often too slow---taking 1--2 years to publish---by which time the results and even the problems may already be outdated.  In contrast, conferences have a much faster review process, typically taking 3--6 months from submission to publication.

Each CS field (@sec:fields-and-areas) has its own "top" conferences---usually around 2--4 per area. For example, NeurIPS, ICLR, and ICML are considered top conferences in AI/ML, while ICSE and FSE are among the tops in Software Engineering.
These conferences have a rigorous #gls("peer-review", first:true) process, and only a small percentage of papers are accepted.

As mentioned in @chap:research-experience, having a paper accepted at a top-tier conference can be a big deal and makes you stand out from other prospective students. 
CSRankings and CSPicks (@chap:rankings) identify the top conferences in each area and rank departments based on their publications in these conferences.


*Journals.* While journals are not as popular in CS, they exist and serve a different purpose---to publish more mature and complete work.
For example, a conference paper might present a new algorithm and some initial experiments, while a journal paper would include full detailed proofs and more thorough experiments and analysis. 

Many CS areas do not have journals but some do. For example, TSE (Transactions on Software Engineering) is a top journal in SE and has exceptionally high impact-factors (higher than many top conferences)---but this is a rare exception.

#note-block[
  Note that some CS areas, such as PL and SE, are publishing conference papers as journals (so a hybrid model).
  Among other reasons this allow for longer papers and to be consistent with other disciplines such as math and physics. For example, papers in well-known PL conferences including POPL and OOPSLA are now published as special issues in the PACMPL (Proceedings of the ACM on Programming Languages) journal. However, despite this publishing technicality, these are still considered conferences and has the benefits of conferences such as fast review and publication process, and in-person presentation at the conference. Most researchers would treat them exactly as conference papers.
]

#paragraph[Best Paper Awards][Conferences often give out _Best_ or _Distinguished_ paper awards to a small set of accepted papers (e.g., 10% of accepted papers at ICSE) to recognize that they have high-quality and potential impact. AI/ML have _Oral_ and _Spotlight_ papers that are selected from accepted papers based on their quality and potential impact, and thus are equivalent to traditional best papers.

These best paper awards are determined by the program committee and often presented to the authors at the conference. Note that these are not the same class as the "Test-of-time" paper awards, which are extremely prestigious and discussed in @sec:research-awards.]

#paragraph[Citations][Citation counts, e.g., through Google Scholar, are often used to measure the impact of a researcher's work---how many people have cited their work. Google Scholar also has other metrics such as h-index and i10-index. The h-index is the number of papers with at least h citations, while the i10-index is the number of papers with at least 10 citations.

However, citation-based metrics can be inaccurate and misleading because this strongly depends on the areas. For example, AI/ML papers often have very high citation counts---even when they are _not_ published and just appear on arXiv. There are also numerous stories of "gaming" the system, e.g., paying others for citations. Thus take citations with a grain of salt when it comes to selecting advisors. For example, new faculty often have low citation counts, but this does not mean they are not good researchers or not productive.]


=== Involvement in the Research Community

Faculty have various activities within their research community.
These are mostly voluntary, but they are important for establishing and maintaining their reputation and visibility.

- Reviewers for Conferences. _Being a PC member_---reviewer for papers---of a top conference is the most common. Just as publishing in top conferences, this gives visibility and establish repuation.
  New faculty aims to be on the PC of a top conference in their area, and  for more leadership roles as they become more well-known. PC chairs of top conferences are often senior and well-known reseachers.

- Reviewers for Journals. Similar to PC member, faculty also serve as reviewers for journals such as being on the _editorial board_ of major SE journals like TSE, JSS, and TOSEM. 
  However, being a journal reviewer is less visible than being a PC member because the journals do not list their reviewers as conferences do with PC members. Moreover, due to the focus of conferences in CS, many faculty do not publish in journals and therefore do not review for them.

- Grant Proposal Panelist. Another service
  is reviewing proposals for funding agencies such as #gls("NSF"). In addition to shaping the landscape of research directions (e.g., by deciding which proposals to fund), being on an NSF _review panel_ provides insights into good proposal writing and opportunities to connect with program officers and peers. However, being an NSF panelist is not as common as being a PC member (many faculty never got invited), and it is often seen as a "bonus" rather than a requirement for faculty.

== Research Achievements and Awards

Activities listed in @sec:common-research-indicators --- publishing papers and involving in research community---are common and _expected_ for all research faculty, especially those at top institutions. 
They are the bread and butter of research, but they are not _exceptional_ achievements that make a faculty stand out.
After all, you rarely see departments highlighting a faculty's publications or PC memberships on their websites or news pages. 


However, department and university websites will spotlight certain awards and honors, listed below, that are _genuinely exceptional_ and give more meaningful insights into a researcher's impact and standing in the field.


#figure(
  image("files/phd030810s.png", width: 70%),
  caption: [Academic Awards. Source: #link("https://phdcomics.com")[PhD Comics] (© Jorge Cham).],
)


//%GIVE EXAMPLES from Big Univs celebrating these awards. 

=== Early-Career Funding Awards

These refer to prestigious grants and fellowships for early-career faculty such as assistant professors who have not yet received tenure (@sec:faculty-types). In addition to coming with major funding, these awards are highly valued and can significantly boost the tenure case and career of the recipient. 

+ *NSF CAREER Award:* The _most prestigious award_ for junior faculty with research _and_ educational excellence. It comes with a 5-year research grant, which is substantial for early-career researchers. 
  
  Given its impact on tenure review, some junior faculty consider the CAREER award so important that they may prioritize it over other major life events such as having children (no kidding!).
  In some cases, faculty even consider moving to a better school after getting this award.


  + *NSF CRII (CISE Research Initiation Initiative):* A "mini" version of CAREER for junior faculty in CISE (Computer and Information Science and Engineering) directorate. It comes with a 2-year grant and many faculty use this as a stepping stone to apply for the CAREER. Note that this seems to be phasing out and might not be available in the future. 
    
  + *PECASE:* (Presidential Early Career Award for Scientists and Engineers) A small number of CAREER awardees are selected for this recognition and therefore highly prestigious. PECASE is given by the White House and is the highest honor given to early-career scientists and engineers. See an #link("https://www.csail.mit.edu/news/csails-broderick-and-carbin-earn-presidential-early-career-awards")[example] of a PECASE awardee from MIT.
  
+ *YIP (Young Investigator Program):* Given by defense agencies such as the DoD, DARPA, ONR and have the similar goals as CAREER but strictly for US citizen or permanent residents. They are not as popular as CAREER, focus on very restricted topics (e.g., only in areas that the DoD is interested in), and have a shorter duration---3 years instead of 5. YIP recipients can also be considered for the mentioned PECASE recognition.
  
+ *Sloan Fellowship:*  Comes with a \$75K research grant over 2 years for junior faculty with exceptional potential in their field. Unlike the CAREER or YIP, these are nominated by their institutions and faculty cannot apply directly.

Other awards that junior faculty can get include the _ACM Dissertation Awards_. 
The ACM SIGs (Special Interest Groups) such as SIGPLAN (programming languages) and SIGARCH (architecture) have  dissertation awards for best PhD dissertation in different areas of CS. These are typically given _after_ the student has graduated and thus are for very junior faculty who recently graduated.   


//%  These industrial awards are very flexible (unrestricted) and thus prof. often save them for emergencies (e.g., when they cannot get NSF funding).


=== Research Awards <sec:research-awards>

These refer to awards given to more senior researchers for their outstanding contributions to their field.
These can be (i) lifetime achievements in the field---such as ACM or IEEE Fellows, and (ii) specific work that were published 10+ years ago and that have made significant impact. 


==== Lifetime Achievements  <sec:lifetime-achievements>

- *#link("https://awards.acm.org/turing")[Turing Award]* is the _highest honor_ in CS for lifetime achievements and contributions to the computing community. It comes with a \$1M prize and is often called the _"Nobel Prize of Computing."_ (Computer Science does not have a Nobel Prize, but the Turing Award is often considered its equivalent.) Turing Award winners are often senior researchers with a long history of impactful contributions to the field. For example, the 2020 Turing Award was given to Alfred Aho and Jeffrey Ullman for their work on algorithms and programming languages, and the 2018 Turing Award was given to Yann LeCun, Geoffrey Hinton, and Yoshua Bengio for their work on deep learning.

- *#link("https://www.macfound.org/programs/awards/fellows/")[MacArthur Fellowship]* are also known as the _"Genius Grant"_ and given to individuals who have shown exceptional creativity in their work and the promise for more in the future.  For example, in CS, the 2020 MacArthur Fellowship was given to Dawn Song for her work on security and privacy, and the 1998 MacArthur Fellowship was given to Tim Berners-Lee for inventing the World Wide Web.


- #link("https://awards.acm.org/fellows")[*ACM*] and #link("https://www.ieee.org/communities-connection/awards-recognition/ieee-fellows")[*IEEE*] Fellows are prestigious honors for researchers with long-term contributions and leadership in computing fields. These are typically given to very senior researchers (e.g., full professors). Note that there are also ACM and IEEE Senior Members, which are a step below Fellows and can be self-applied (see news examples of an IEEE Fellow at #link("https://siebelschool.illinois.edu/news/elevation-to-ieee-fellow-further-proves-significance-of-hoiems-impact-in-computer-vision")[UIUC] and Senior Member at #link("https://uwaterloo.ca/computer-science/news/ian-goldberg-named-senior-member-ieee")[Waterloo]).
  
  

#note-block[
  CSRankings (@chap:rankings) highlights faculty who are ACM Fellows or Turing Award winners.  You can also find a list of ACM Fellows at #link("https://awards.acm.org/fellows")[ACM Fellows] and Turing Award winners at #link("https://awards.acm.org/turing")[Turing Award]. 
  
  Note that these individuals might no longer be active in research and therefore do not have many recent publications or recruit students.  You should check their recent publications and research activities to see if they are still active in research and recruiting students.   
]


==== Most Influential Paper Awards 

_Most Influential Papers, Test of Time, or Impact Awards_ are given to papers that were published 10+ years ago at a top venue and made a lasting contribution to their area of research, e.g., creating a new research field. In other words, the work described in these papers has stood the _test of time_. Typically, these papers are highly cited and have inspired many follow-up works.
Note that these paper awards are different than Distinguished or Best Paper awards, which are given at the conference and therefore might not be as well-known or influential.   

Note that while typically given to senior researchers (due to the 10+ years requirement), some junior faculty have received these highly prestigious awards for their work as shown in @fig:LOR4junior. 

#figure(
  align(left)[#text(size: 0.9em)[
    #emph-block[
    _"It is highly noteworthy that #redact[Vu] has earned two 10-year test-of-time awards for [his] papers [, including a prestigious ICSE Most Influential Paper Award]. Senior computer scientists count themselves fortunate to
    earn even one such award at some point in their careers, but it is highly unusual and commendable that #redact[Vu]
    has earned two of these awards already, less than ten years after completing [his] PhD ..."_]]],
  caption: [LOR written by an ACM and IEEE Fellow (@sec:lifetime-achievements) for a junior faculty (some texts redacted for anonymity).]
) <fig:LOR4junior>

=== Industrial and Other Awards

CS faculty also go for awards from industry, which shows that their work has
 impact on real-world applications and industry relevance. Well-known industrial awards include:

- *Amazon Research Award (ARA):* Typically open twice a year for a wide range of research areas. It also comes as a gift of cash or cloud credits.  The amount is small, but is _highly competitive_ as it attracts researchers all over the world, including senior researchers and those from top institutions.
  // - Sony *Faculty Innovation Award:* Open to all researchers in fields related to Sony's business (e.g., AI, robotics, computer vision, gaming).
- *Google Scholar Award:* This award is given once a year for a wide range of research areas in CS. It is only for junior faculty (within X years of their PhD) and is given as a gift.
- *NVIDIA Academic Grant:* This relatively new award typically comes with a gift of "cool" hardware including GPUs and NVIDIA "super"-computer like the DGX Station.

There are also awards from others companies and organization but only in specific areas relevant to their business, e.g., Sony, Samsung, Comcast, and Ethereum Foundation. Some industry labs---like #strike[Google] and #strike[Microsoft] (used to)---have fellowship programs for early-career faculty. These are also competitive and come with funding for one or two years. 


Some companies have partnerships with universities and created awards only for faculty and students at these universities, e.g., faculty awards from Intel and Qualcomm, and Packard Fellowships. 
These awards are not open to all researchers and therefore face less competition (e.g.,  compared to the Amazon ARA which attracts a huge number of applicants from all over the world) and are less well-known internationally. However, they are still valuable and meaningful for faculty at these universities.


#pagebreak()
= Writing in LaTeX or Typst <chap:writing-latex>
//#chapter-opener([You should write your academic documents in LaTeX.])

#simpsons[Coming to the book fair sure was a great idea. 'Cause you can't write if you don't know what the competition is up to.]


When you apply for PhD programs or fellowships (@sec:nsf-grfp) such as the NSF GRFP or DOD NDSEG, you will need to write multiple statements and CV.
You might be using MS Word, but you should strongly consider writing your statements and even CV in LaTeX (and compiled to PDFs, which are then uploaded to the application system). In CS and many other STEM fields, #highlight[LaTeX is the de facto standard] for writing documents—papers, proposals, dissertations, and letters. 


Most CS faculty are used to seeing formatting that LaTeX produces, and some might find Word's default left-aligned, uneven layout distracting.
While reviewers will not penalize you for using Word, subtle irritations can affect how they read your writing (after reading dozens of applications, these small things add up). Given that LaTeX is free and easy to use (e.g., see #link("https://www.overleaf.com")[Overleaf]), it is worth the effort to learn. 

Below is a very basic example of a LaTeX document with 11pt font and 1-inch margins. You can start with this and modify it.

```tex
\documentclass[11pt]{article}
\usepackage[margin=1in]{geometry}
\begin{document}
...
\end{document}`)
)
```

#paragraph[A quick word on Typst][#link("https://typst.app/")[Typst] is a new typesetting system that is gaining popularity for its ease of use and modern features, such as incremental compilation and instant live preview. It is not as widely used as LaTeX _yet_, but it is worth considering if you want to try something new (though you will likely need to learn LaTeX anyway as most publishing venues do not support Typst). 

For example, #link("https://code.roars.dev/phd-cs-us")[this book] is originally written in  #link("https://code.roars.dev/phd-cs-us/blob/main/demystify-old.tex")[LaTeX] but has been converted to #link("https://code.roars.dev/phd-cs-us/blob/main/demystify.typ")[Typst].]

#pagebreak()
= Academic and Cultural Differences <chap:cultural>

#simpsons[As intelligent as you are, you have to learn to appreciate other points of view.]

This section lists some general academic and cultural issues that students, especially international ones, might want to pay attention to.

// *Diversity* US universities prioritize diversity and inclusion. Students need to respect and appreciate varied opinions, backgrounds, and cultures. Unlike some countries where certain voices are marginalized, in the US, all perspectives are valued equally (especially at universities). Racism or discrimination will have serious consequences, including academic and disciplinary actions.

== Academic Integrity (Cheating and Plagiarism)

Plagiarism and cheating (e.g., exams and assignments) are a BIG no-no in the US.  If you're caught cheating, you will face serious consequences, including being expelled from the university (e.g., after the second time at GMU).   This is quite different from many international countries where cheating is common and often tolerated.  Faculty is quite good at detecting cheating (we have been dealing with these situations so many times over so many years), and _will_ report cheating cases.  

Here are the typical steps that will happen if you are caught cheating (e.g., on an exam or assignment): 
  + A faculty suspecting a cheating case will report it to the Office of Academic Integrity (OAI) or some equivalent office at the university. The report often has supporting evidence, e.g., a copy of the exam or assignment; 
  + OAI will investigate the case, e.g., by interviewing the student and faculty, and checking the evidence; 
  + OAI will make a decision, e.g., whether the student is guilty or not; and 
  + If guilty, OAI will decide on the punishment, e.g., a failing grade for the assignment or exam, a failing grade for the course, or even expulsion from the university, especially for repeat offenders.

It is important to note that in most cases _after_ receiving the report from your prof., OAI _completely_ takes over and makes its decision.  
This means begging your professor will not help because they simply are no longer involved in the case and cannot do anything.
This is because OAI is an independent office, separate from your professor and department, that handles all academic integrity cases at the university and has its own procedures and policies. If you are found responsible, you can appeal to OAI, but not to your professor or department. #highlight[In short, whatever you do, don't cheat---it can ruin your career and is not worth it!]

== Illegal Software <sec:illegal-software>

 Using illegal/cracked software is very common in many countries (and even in the US). However, #highlight[do not install or use them on university computers], even those given to you by your advisor.  It is unlikely that the university will track you down, but it is the _software company_ that will.  They have very sophisticated tools to detect illegal software and can sue your university/department.  Imagine your department or advisor being sued for a large sum of money, and it is _you_ who caused it.  If you need to purchase software,  ask your advisor or the department (@sec:buying-equipment).


== Costly Gifts <sec:gifts>

In many countries, it is customary to give professors costly gifts---such as fancy liquor, jewelry, or even an envelope stuffed with cash during holidays or special occasions. It's meant to show respect and appreciation (or, let's be honest, as an attempt to get better grades or recommendations). Understandably, this is a cultural norm in many countries, and professors and students are used to it. However, in the US, it can be considered _highly inappropriate_ and is strongly discouraged. Giving your professors these gifts will make them feel very uncomfortable, and in many cases they are required to report them to the university.

 However, that doesn't mean you can't show your appreciation. In fact, small, personal tokens, like small souvenir from your country, a fridge magnet, keychain from your hometown, or even just simple thank-you hand-written card, are very welcomed.  Some professors proudly display their gifts, which can come from students and colleagues (e.g., when they travel to their home countries or conferences). In summary, #highlight[small gifts are fine], but avoid anything that might make your professors uncomfortable.

== Maintaining Good Relationships with Your Professors <sec:maintaining-relationships>

There's a misconception that in the US it's all business, with professors as bosses who pay students for their work and that lab mates are just work colleagues; and that doing nice things means expecting something in return.

However, the reality is quite the opposite. While people can be straightforward and appear "cold", they are also informal, friendly, and very caring (in ways that might surprise you).
With lab mates and colleagues, you will often work and go to lunch together, confide in each other, help each other navigate the academic journey, and often become lifelong friends.
With your professors, you can call them by their first name (@sec:address), disagree with them and argue (and gain respect doing so), seek their help (even on personal matters), come to their houses for parties or gathering (e.g., my lab always come to my house for #link("https://photos.app.goo.gl/LFtbqQUuznq9eiL7A")[Thanksgiving]), and give them small thoughtful gifts that they proudly put on their desks (@sec:gifts).  
Many people maintain lifelong relationships with their professors and colleagues, staying in touch through cards, emails, and visits, even after they no longer work together.

#example-box[
  I maintain a close relationship with my former professors and mentors. When there is a new event in my life (or theirs), I often email them or call them, e.g., when I get married, have a new baby, new job, etc. I think this does not bother them a bit; they are genuinely interested in knowing and helping solve these "dramas" in my life.

  I have also collaborated with them after I graduated e.g., I recently got an NSF grant with Deepak, who was my PhD advisor.
  I also visit my former professors when I am in their area. I meet Thang Bui (my MS advisor) at least once a year when I come back to Harrisburg to visit my parents. When Steph, my other PhD advisor, was in DC for a meeting, I invited her to give a talk at GMU. 
  
  In short, while I am a bit closer to my former advisors and mentors than most people (e.g., I still keep in touch with my middle school teacher), it is always a good idea to maintain a good relationship with people who have helped or worked well with you. A simple, short email or text once in a while (e.g., a _"Hi X, I heard you just got promoted ... Congrats!"_) would suffice. They will appreciate it, and you never know when you might need their help.
]

== How to Call or Address a Professor? <sec:address>

// \sectioninfo{What should you call your profs.? Many possibilities (e.g., Prof., Dr., and even their firstnames), but not Mr., Mrs., or their firstname in the first email.}

#figure(
  image("files/c5.png", width: 85%),
  caption: [A (humorous) flowchart for deciding how to address your professor: when in doubt, use "Prof./Dr. Lastname" (@sec:address). Source: #link("https://phdcomics.com")[PhD Comics] (© Jorge Cham).],
) <fig:address-comic>

If you're reaching out to a professor for the first time,  address them as Prof. or Dr. Lastname (if you know that they do not have a PhD, then don't use Dr., but Prof. is fine). Many international students use Prof. or Dr. FirstName LastName, but this can come across as if you're simply copying and pasting names. So just stick with Prof. or Dr. Lastname.  Using _Prof._ is generally the safest option.

_Do not use Mr., Mrs., Ms, or Miss_. This rarely happens, but I have seen  new students (e.g., undergraduates) sometimes use these, which are used in K--12 schools but not in higher education.

Moreover, _do not call the prof. by their first name when you first meet them or email them for the first time_. As you become more familiar with your prof and depending on their preferences, you may transition to addressing them by their first name.
For example, I prefer that my students and colleagues call me Vu. Some students call me _Dr. Vu_, which I find a bit amusing but am totally fine with it. And, of course, don't call the prof. "dude" or #link("https://www.reddit.com/r/Professors/comments/1fzjai1/strangest_way_a_student_addressed_me/")["bro"].

#example-box[
  *Kapur:* I was amused to read this as if I recall correctly, you never called me by my first name when you were at UNM. You always called me Prof. And, many times, I would jokingly call you back as Prof.
  
  *Vu:* Yes, for some reason I enjoy calling you "Professor" (without appending a last or first name).  The use of Prof. Vu may have foreshadowed my future in academia.
]

Note that in some universities the formal title Dr. Lastname is preferred over Prof. Lastname. Moreover, be aware that not all faculty members hold a PhD, so using Prof. Lastname is a suitable alternative. For example, at many places, including Mason, the requirement for adjunct faculty (@sec:faculty-types) is a PhD or an MS with significant industry experience. You just need to observe and follow the conventions at your particular institution. One way to determine how to address a prof. is to observe how they _sign_ their emails (e.g., some sign as Prof. or Dr. Lastname, while others sign as Firstname), or how they introduce themselves in class. For example, while I don't sign my emails, I introduce myself as "Vu" in class. You will get used to it after a while. 

#paragraph[Referring to Professors You Know][When referring or talking about a prof (e.g., your mentor) that you know, you can just informally use their names if they are OK with it as mentioned above (or Dr./Prof., if you want to be formal). You can also include their institution if it makes it more precise.  For example, I can say:  _"I did my postdoc with Jeff Foster at Univ. of Maryland"_.

#caution-block[
Do not include ranking (@sec:faculty-types), e.g., Assistant, Associate, Scientist, ..., when referring to someone. I see many international students include a lengthy title of people they know, e.g., _I am advised by Asst. Prof. X, and also collaborate with Distinguished Scientist Y_.
This is _not necessary_ and makes it look like you're trying to show off your connections. These nuances represent some cultural and academic differences in the US that you may encounter but will gradually adapt to.]
]


== Speak Up, Ask Questions, and Disagree <sec:speak-up>

In some countries, students are expected to mostly listen to their professors, and openly disagreeing with a professor might be considered disrespectful. This is generally not the case in US academia, especially when you are doing a PhD.

You are _supposed_ to ask questions and disagree when you think something is wrong. In fact, your prof. might be more worried if you simply agree with everything they say.

For example, suppose your advisor says, _"Let's use method X for this problem,"_ but you think X will not work because of some assumption. You can simply say:

_"I don't think X will work here because the input does not satisfy assumption Y. Maybe we could try Z instead?"_

This is completely normal. Your advisor might disagree with you, and you might argue about it for 30 minutes. That's research! Neither side should take it personally.

Of course, there is a difference between disagreeing and being rude. _"I don't think this works because ..."_ is fine. _"This makes no sense"_ is probably not a good way to talk to anyone.

In fact, I generally like it when my students challenge my ideas because it shows that they are thinking independently instead of just doing whatever I tell them. This is also part of why "fit" with an advisor matters so much when choosing a lab (@chap:choosing-advisor)---you want someone whose style of give-and-take you are comfortable with.

#tip-block[As you become more senior in your PhD, you should gradually move from asking _"What should I do?"_ to saying _"I think we should do X because of Y. What do you think?"_]

== Be Proactive and Ask for Help <sec:be-proactive>

Your prof. will not always tell you exactly what to do or constantly check whether you are OK. This can be surprising to students who are used to a more structured educational system---it is one reason a good advisor-student fit matters so much (@chap:choosing-advisor).

If you need something, _ask_.

For example:

- If you have been stuck on a proof or implementation for several days, tell your advisor.
- If you want feedback on a paper draft, send it and ask.
- If you need a GPU, server, software license, dataset, or new laptop for your research, ask.
- If you want to attend a conference, ask whether there is funding.
- If you don't understand what your advisor asked you to do, ask them to clarify.
- If you think you need a meeting, schedule one.

Do not spend three weeks stuck on a problem and then tell your advisor, _"I didn't make any progress because I didn't know what to do."_ Your advisor will probably wonder why you did not tell them three weeks earlier.

For example, an email or message as simple as this is perfectly fine:

_"Hi Vu, I've been trying X and Y for the last few days, but both fail because of Z. I am not sure what else to try. Could we talk about it sometime tomorrow?"_

This is much better than silently getting stuck.

Note that this does _not_ mean you should immediately ask your advisor whenever something does not work. Try to solve the problem yourself first. Search for the answer, read the relevant papers or documentation, try a few reasonable solutions, and then explain what you tried when you ask for help.

In short, being independent does not mean never asking for help. It means trying things yourself and knowing when you need help. The same directness applies when reaching out to a potential advisor before you even apply (@sec:tmpl-contact-email) or when asking someone for a letter of recommendation (@sec:asking-LOR)---just say clearly what you need.

== Deadlines, Meetings, and Saying No <sec:deadlines-saying-no>

If you agree to do something, people generally expect you to do it. If you cannot do it, tell them as early as possible.

For example, suppose your advisor asks:

_"Can you finish these experiments by Friday?"_

If you know there is no realistic way you can finish by Friday, don't just say _"yes"_ because you are afraid to disappoint them. Say something like:

_"I probably cannot finish all of them by Friday. I can finish experiments A and B by Friday and the rest by Monday. Would that work?"_

That's perfectly reasonable.

What is much worse is saying _"yes,"_ not finishing the work, and then disappearing when Friday comes.

The same applies to meetings. Try to be on time. If you have a meeting at 2:00 PM, arriving at 2:00 or a few minutes earlier is normal. If you are going to be 15 minutes late, send a quick message. If you cannot attend, let people know instead of simply not showing up.

Academia is actually quite flexible about schedules. Your prof. probably does not care whether you work at 9 AM or 2 AM. But people _do_ care whether you keep commitments and communicate when something changes.

#tip-block[It is OK to say no. _"I cannot do this by Friday"_ is much better than saying yes and then not doing it.]

== Email and Communication Style <sec:email-style>

Academic communication in the US is usually much less formal than what many international students are used to.

You do not need to write something like:

```
Dear Highly Respected and Honorable Professor Smith,

I sincerely hope this email finds you in the best of health. I humbly
request your valuable time and kind consideration...
```

This sounds strange to most US professors.

Something like this is completely fine:

```
Hi Prof. Smith,

Could we meet sometime this week to discuss my experiment results? I am
free Wednesday afternoon and Thursday morning.

Thanks,
Alice
```

Short and clear emails are actually preferable because professors receive a _lot_ of email.

Similarly, if your advisor sends you a quick message such as _"Can you send me the plot from yesterday?"_, you do not need to respond with a formal letter. _"Sure, attached"_ is fine.

However, informal does not mean careless. Give enough information so the other person knows what you are talking about. For example, an email saying only _"Professor, please check this,"_ with an attachment named `final2_new_revised.pdf` is not particularly helpful. Say what you want them to check.

Also, if someone asks you several questions in an email, try to answer _all_ of them. This sounds obvious, but it happens surprisingly often that I send a student three questions and get a reply to only the first one.

The same short, clear style applies when you email a potential advisor for the first time (@sec:tmpl-contact-email) or ask someone for a letter of recommendation (@sec:asking-LOR, @sec:tmpl-lor-request)---and remember to address them as Prof. or Dr. Lastname until told otherwise (@sec:address).

== Modesty and "Selling" Yourself <sec:modesty-selling>

Many students, especially those from cultures that value humility, are uncomfortable talking about their own accomplishments. This can hurt you in US academia, particularly in materials like your SOP (@chap:sop) and during interviews (@chap:interview), where clearly describing your role is expected rather than seen as bragging---this ties closely to the individualist, self-promoting culture discussed in @chap:cultural-misc.

You do not need to brag, but you _do_ need to clearly explain what you did.

For example, suppose you worked with two other students on a research project and you designed the main algorithm and implemented most of the system. In your SOP or interview, don't just say:

_"I participated in a research project on neural network verification."_

That tells me almost nothing about what _you_ did.

Instead, say:

_"I designed the main verification algorithm and implemented the prototype. I also ran the evaluation on 500 neural networks and analyzed the results."_

That is not bragging. It is simply telling me what you did.

The same applies to papers. Saying _"I have a paper at Conference X"_ is useful, but I also want to know your contribution. Did you come up with the main idea? Implement the tool? Prove the theorem? Run the experiments? Write most of the paper?

This matters because people evaluating you cannot read your mind. If you don't tell them what you accomplished, they might simply assume someone else did it.

On the other hand, do not exaggerate. If your advisor came up with the idea and you implemented it, don't say _"I developed a new theory of X."_ Just accurately describe your contribution.

In short, there is a difference between showing off and making your work visible. US academia expects you to do the latter.

== Practical Finances <chap:practical-finances>


Your funding (@chap:funding) covers tuition, health insurance, and a stipend, so you will _not_ go into debt for your PhD. But a stipend is modest, and there are some practical money matters---especially for international students---that catch people off guard. This section is a quick survival guide.

#paragraph[The first month is the hardest][Your stipend is paid on the university's schedule (often monthly, sometimes with the first paycheck arriving several weeks after you start). Meanwhile you arrive needing to pay a security deposit and first month's rent, buy furniture, and cover initial expenses---all _before_ any money comes in. Budget to bring enough savings (a few thousand dollars) to cover *6--8 weeks* of living costs on arrival. This is the single most common cash-flow surprise.]

#paragraph[Cost of living dominates the stipend's value][A \$35K stipend goes much further in, say, Pittsburgh or Blacksburg than in the Bay Area or New York City (@sec:selecting-ranking-schools). When comparing offers (@sec:visit-days), mentally divide the stipend by local rent. A nominally smaller stipend in a cheaper city can leave you more comfortable than a bigger one in an expensive one.]

#paragraph[Taxes][Yes, you pay US income tax on the taxable portion of your stipend, and as an international student your situation has extra wrinkles---tax treaties between the US and your home country may reduce what you owe. According to the #link("https://www.irs.gov/individuals/international-taxpayers/foreign-student-liability-for-social-security-and-medicare-taxes")[IRS], F-1 students are generally nonresident aliens for tax purposes during their first five calendar years, though individual circumstances vary. Most universities provide tax-filing software (e.g., Sprintax) and workshops through the international student office. Do _not_ ignore tax filing; it is required, and it matters for future visa and green-card steps (@chap:visa).]

#paragraph[Banking and credit][You will arrive with _no US credit history_, which makes renting and getting a credit card harder at first. Open a US bank account early, get a basic (often secured) credit card, and use it responsibly to start building credit. This pays off later when you rent an apartment or buy a car.]

#paragraph[Health insurance is included---Use it!][Your assistantship includes health insurance (@chap:funding), and it is required (@chap:cultural-misc). Don't skip checkups assuming you are young and healthy---US healthcare is extremely expensive if you ever need it without coverage, and you are already paying for the insurance.]

#tip-block[Your university's _international student office_ (referred to as OIPS at GMU) is your best resource for all of this---taxes, social security numbers, banking, on-campus work rules, and visa paperwork (@chap:visa). They do this for thousands of students every year. Lean on them rather than piecing together advice from forums.]

#caution-block[As an #gls("F-1") student, there are _legal restrictions_ on how and where you can work (@chap:visa). The #link("https://www.ice.gov/sevis/employment")[Student and Exchange Visitor Program] explains that qualifying on-campus work is generally permitted, while off-campus work requires specific authorization (#gls("CPT-OPT", first:true)). Do not take side gigs or freelance work without checking with your designated school official first; unauthorized employment can jeopardize your visa status.]

// #example-box[
//   My international PhD student, Hai, works at Amazon during the summer (where interntional students are allowed to work). Because he did well during his internship, Amazon offered him to continue working there during the next semester, where he is scheduled to be a full time GRA student. He cannot do part-time GRA because that would void his benefits (e.g., health insurance, tuition) and violate his visa status. 
// ]

== Miscellaneous Surprises <chap:cultural-misc>
  
Here are some other common surprises for international students in the US. Note that I skip topics involving politics, religion, tax, and racism as these happen in many countries and are not unique to the US.

#paragraph[Small talk][People often engage in small talk, e.g., about the weather, sports, or weekend plans. This is a common way to start a conversation in the US.

However, avoid asking personal questions, e.g., about salary, age, relationship status, or health, as these are considered private. Talking about kids' activities or schools are OK. Also, do not talk about politics or religion. In fact, we even avoid talking about these sensitive subjects with our family and friends to avoid conflicts.

Sometimes foreigners are surprised by how Americans do not talk about their personal lives, e.g., sharing details about their families, health, or relationships, and that their conversations are often not very "deep" or "mind-provoking". This is just a cultural norm about privacy and personal space (in fact Americans do talk about these with their family and close friends, just not often in public).
]

#paragraph[A culture that embraces extroversion and individualism][The strong culture of individualism in the US can be both liberating and isolating. For example, those with extroverted personalities---who are outgoing and sociable---often seem more successful in social and professional settings. College essays to top universities often require students to describe their extracurricular activities and personal achievements (i.e., selling themselves), which is a reflection of this culture.  In contrast, many countries, especially in Asia, emphasize listening instead of speaking, and humility instead of self-promotion, etc. This is also why clearly describing your own contributions, rather than staying quiet about them out of modesty, matters so much in US academia (@sec:modesty-selling).



#remark-block[

  Do not be confused that an authorative CS prof who is very good at presenting and "selling" their work in the public or has a strong social presence are extroverted. Many of them are introverted but have learned to be extroverted in public settings.  After those exhausted public appearances, they often go back to their room and spend time reading, thinking, and writing by themselves as a way to recharge their energy. Indeed, introverted personalities are often ideal for PhD studies and research, which require a lot of time to read, think, and write _by yourself_.  Note that in your PhD SOPs, we rarely care about your social skills or if you attend many clubs or organizations, which are the successful norms for undergraduate students.
]
]

#paragraph[Healthcare System][You (and your spouse) will need health insurance! Otherwise you will be charged a lot for healthcare services when you need them. However, as mentioned in @chap:funding, your TA/RA (and fellowships) will cover health insurance. Your spouse/children often also get health insurance or significant discounts under your plan.

Note that even with insurance, healthcare services might still be expensive. You should know what your insurance covers and be prepared for unexpected costs. Moreover, the healthcare system has many confusing terms, such as HMO, PPO, deductibles, co-pays, and coinsurance (take a look at the Explanation of Benefits, or EOB, statement you receive from your insurance company). It's arguably the most complicated system in the US, and even Americans often do not understand it (and politicians often exploit this to their advantage). Do not hesitate to ask your HR office or insurance company for help.]

#paragraph[Car Dependency][While some cities, such as New York City, Boston, and Washington DC, have good public transportation, most places in the US are highly car-dependent. If you do not have a car, you will need to rely on friends, Uber, or public transportation, which can be inconvenient and time-consuming. Many international students end up getting a driver's license, which is highly convenient and replaces formal documents (e.g., ID, passport), and eventually buying a car.]


#paragraph[Tipping Culture][Unlike many other countries, tipping is expected for various services, especially in restaurant. So adding an extra 15--20% to your bills is common, especially in restaurants.]

You should also tip other services, e.g., Uber, taxi, haircuts, and hotel services. The minimum wage for tipped employees is typically lower than the standard minimum wage, so tips are an important part of their income.

#note-block[
For convenience, many restaurants and services have a tipping option built into their payment system (e.g., on the receipt or app), which makes it easy to add a tip. If you go with a large group, the restaurant might automatically add a gratuity (e.g., 18%) to the bill, so be sure to check the bill before adding an additional tip. You can also tip in cash, which is sometimes preferred by service workers because they receive the full amount without any processing fees. However, tipping through the payment system is more convenient and common.

In addition, while many tip on the total (post-tax) amount, some tip on the pre-tax amount. For example, if your bill is \$100 before tax and \$108 after tax, a 20% tip would be \$20 if you tip on the pre-tax amount, and \$21.60 if you tip on the post-tax amount. 
In general, tipping on the pre-tax amount is common and the logic is that tax is a government fee and not part of the service. However, the amount is not huge and tipping on the post-tax is also more convenient, so you can choose either way.
]



//   %\paragraphP{Conversation} Americans are generally friendly and open.  However, there are certain things that we rarely talk about, e.g., salary, relationship status, or health. 
// %  These are considered private and should not be asked.  Also, do not talk about politics or religion in general (in fact, we do not even talk about these with our family and friends to avoid conflicts).  
  
  
//   %Sometimes foreigners are surprised by how Americans do not talk about their personal lives, e.g., sharing details about their families, health, or relationships, and that their conversations are often not very "deep" or "mind-provoking". This is just a cultural norm about privacy and personal space.
  
  
//   %This can be surprising for people from countries where strangers do not typically talk to each other.  Americans are also generally informal and use first names, even with people they have just met.  This can be surprising for people from countries where titles and last names are used, even with close friends.
// 	%\paragraph{Individualism} The strong culture of individualism in the US can be both liberating and isolating. For example, Americans are encouraged to express their opinions and pursue their goals, and are more focused on their personal rights (e.g., they do not want people do things in front of their house). 



//   % \paragraph{Racism and Segregation} While some find the US to be less racist than expected, others note that racism and segregation are still prevalent, often manifesting subtly in daily life or visibly in segregated neighborhoods.

// 	%\paragraph{Litigiousness} The US is known for its litigious culture, where lawsuits are common, and people can be sued over seemingly minor issues. This can be surprising for newcomers used to different legal systems.


//   % \paragraph{Consumerism and Scale} The US is often associated with large portions, big cars, and massive stores like Costco. The emphasis on consumption and abundance is notable.

// 	% \paragraph{Religious Influence} Religion, particularly Christianity, plays a more visible role in public and political life in the US compared to many other countries.


// % \begin{commentbox}
// %   [DK:] Here are a few items you may consider addressing: putting international students in touch with other students from their countries, assuring them that they would be picked up from airports upon their arrival and that their initial stay will be taken care of. Most universities have other resources for these, but it is worth mentioning that they would be taken care of upon arrival and can get help during the transition phase. Learning to cook was a big deal when I arrived over 50 years ago-August 1973. But things have changed as one can find many ethnic food places, a big contrast from 1973, when there were two Indian restaurants in Greater Boston area.
// % \end{commentbox}

#pagebreak()
= Rankings of CS PhD programs <chap:rankings>
//#chapter-opener([CSRankings.org is a ranking system based on faculty publications at top CS conferences. CSPicks is not a ranking system and instead focuses on exploring the research strengths of CS departments and faculty.])

#simpsons[The whole damn system is wrong!]

When researching where to do a CS PhD, many students use rankings like the U.S. News & World Report. However, these widely publicized rankings are often criticized by CS researchers (e.g., @fig:csrankings-quote) for their lack of transparency and relevance. In contrast, data-driven open source ones such as CSRankings.org are increasingly used by faculty and PhD students to assess the true research strengths of CS depts. 

#caution-block[*Unpopular opinion:* Ranking matters, but usually not in the way applicants think. A famous university name can open doors, and a large department can provide more advisors, collaborators, and escape routes if one lab fails. But a university-wide number cannot tell you whether anybody there works on your problem, has funding, or wants another student. Treat ranking as evidence, not a command.]

#figure(
align(left)[
  #text(size: 0.9em)[
    #emph-block[_"The ranking methodology \[of US News\] is flawed, for a simple reason that any computer science researcher could tell them immediately. And we did. Influential researchers in computer science pointed out the flaws directly to editors at US News; they were ignored."_

    _"No ranking is perfect, but this \[CSrankings\] is defensible and open."_]]],

  caption:[#link("https://www.theexclusive.org/2017/11/cs-rankings.html")[Charles Sutton (Google DeepMind).]])<fig:csrankings-quote>





== What's Wrong with Popular CS Rankings <sec:rankings-cra>

#figure(
  image("files/xkcd_standards.png", width: 70%),
  caption: [Rankings proliferate the same way standards do---each claims to be the definitive one, so no single ranking should be treated as authoritative. Source: #link("https://xkcd.com/927/")[xkcd 927], #link("https://creativecommons.org/licenses/by-nc/2.5/")[CC BY-NC 2.5].],
) <fig:standards>

Popular college rankings such as #link("https://www.usnews.com/best-colleges")[U.S. News & World Report] or #link("https://www.topuniversities.com/university-rankings")[QS World University Rankings] are often based on subjective criteria---such as reputation, faculty credentials, and student satisfaction---and are not transparent---how scores are calculated is often not disclosed.
CS research community has long questioned and discouraged the use of these rankings. For example, the Computing Research Association (CRA)---a highly respected organization in CS---issued a sharp critique of the U.S. News & World Report's global rankings for CS depts, calling the methodology _"deeply flawed and misleading"_#footnote([#link("https://cra.org/cra-statement-us-news-world-report-rankings-computer-science-universities/")]). Among many issues, the CRA highlighted that the rankings rely heavily on journal publications indexed by the Web of Science, ignoring conference publications—despite conferences being the primary venue for publishing top-tier CS research (@sec:pubs-top-tier).   

// In short, rankings from sources like US News are mainly used high school and undergraduate students (or their parents) who are not familiar with CS research or PhD study. Those who know the field best---CS PhD students and faculty and researchers---largely discard them.

// % \begin{commentbox}[CRA:]
// %   Anyone with knowledge of CS research will see these rankings for what they are — nonsense — and ignore them. But others may be seriously misled. 
// % \end{commentbox}

== CSRankings.org <sec:csrankings>
Instead of traditional school rankings, many PhD students and faculty use #link("https://www.csrankings.org")[CSRankings.org], which is a ranking system based on faculty publications at top CS conferences.  The metrics and ranking calculation are transparent and ranking results are updated automatically (after the conference proceedings are indexed in DBLP).  Because the approach is entirely data-driven and open source, it is not influenced by any subjective opinions or biases, and very difficult to manipulate. The number of #link("https://github.com/emeryberger/CSrankings/pulls")[GitHub pull requests] by CS faculty (in fact, even non-CS faculty) to be included in the rankings is a good indicator of the impact of the rankings.

#paragraph[Ranking Method][CSRankings uses the _geometric mean_ to summarize the performance of a department across multiple disciplines. The score for each department is calculated as follows:

$ "averageCount" = root(N, product_(i=1)^N ("adjustedCounts"_i + 1)) $

where $N$ is the number of fields (e.g., OS, Cryptography, ML, PL) selected, and `adjustedCounts_i` is the number of papers published by faculty of that department in a field $i$.]

CSRankings thus favors departments that publish in multiple fields.  For example, a department that has 10 papers in each of the 10 fields will have a higher `averageCount` ($root(10, 11^10) = 11$)than a department that has 100 papers in one field and 0 in the others ($root(10, 101 · 1^9) = 1.59$). This is because the geometric mean is designed to favor departments that have a balanced distribution of publications across multiple fields, rather than excelling in just one field. 

Note that CSRankings allows users to select the fields they are interested in, so the `averageCount` can be calculated based on a subset of fields. For example, if the student is only interested in field $X$, then the `averageCount` will be $root(1, 101) = 101$.
More details and justification for this metric can be found in the #link("https://csrankings.org/faq.html")[CSRankings FAQ].


#paragraph[Selecting Faculty][Another useful feature of CSRankings is that you can filter faculty by research areas to find who are active in your area of interest. For example, if you are interested in ML, you can select ML and see departments and faculty members active in ML. You can also see the number of papers published by each faculty in that area,  and their publication counts in recent years (e.g., 2020--2024). This is useful for finding faculty publish frequently in your area of interest and gauge their productivity (@chap:research-achievements).]

=== Top CS Programs in the US
@tab:ranking lists the top 50 CS programs from CSRankings. For the most up-to-date rankings, visit the website directly.


#figure(
  caption: [The top 50 CS programs in the US (#link("https://www.csrankings.org")[CSRankings.org], Aug. 2026). #super[\*] indicates that the university has  #link("https://roars.dev/phd-cs-us/viet-cs-profs-us")[Vietnamese prof.] that can advise CS PhD students.],
  text(size: 0.9em,
  table(
    columns: (auto, 1fr, auto, 1fr),
    stroke: none,
    [*1*], [Carnegie Mellon], [*25*], [University of Chicago],
    [*2*], [Univ. of Illinois at Urbana-Champaign#super[\*]], [*27*], [Univ. of California - Riverside],
    [*3*], [Univ. of California - San Diego], [*28*], [University of Virginia],
    [*4*], [Georgia Institute of Technology], [*29*], [Rutgers University#super[\*]],
    [*5*], [MIT], [*30*], [Duke University],
    [*6*], [University of Washington], [*30*], [University of Utah],
    [*7*], [Univ. of California - Berkeley], [*32*], [George Mason University#super[\*]],
    [*8*], [Cornell University], [*32*], [Pennsylvania State University],
    [*9*], [Univ. of Maryland - College Park], [*34*], [Texas A&M University#super[\*]],
    [*10*], [University of Michigan], [*34*], [Univ. of California - Santa Barbara],
    [*11*], [Stanford University], [*36*], [Boston University],
    [*12*], [Northeastern University#super[\*]], [*36*], [Virginia Tech#super[\*]],
    [*13*], [Purdue University], [*38*], [Univ. of California - Santa Cruz],
    [*14*], [New York University], [*39*], [Arizona State University#super[\*]],
    [*14*], [University of Texas at Austin], [*39*], [Harvard],
    [*14*], [University of Wisconsin - Madison#super[\*]], [*39*], [Johns Hopkins University],
    [*17*], [Princeton University#super[\*]], [*39*], [University of Illinois at Chicago],
    [*18*], [University of Pennsylvania#super[\*]], [*43*], [North Carolina State University],
    [*19*], [Columbia University], [*43*], [Rice University],
    [*20*], [Univ. of California - Los Angeles], [*43*], [University of North Carolina],
    [*21*], [University of Southern California], [*43*], [Yale University],
    [*22*], [Univ. of California - Irvine], [*47*], [Ohio State],
    [*23*], [Univ. of Massachusetts Amherst#super[\*]], [*47*], [Univ. of California - Davis],
    [*24*], [Stony Brook University], [*47*], [University at Buffalo#super[\*]],
    [*25*], [Northwestern University], [*47*], [University of Colorado Boulder],
    [], [], [*47*], [University of Minnesota],
  ))
) <tab:ranking>


== CSPicks <sec:cspicks>

#link("https://cspicks.roars.dev")[CSPicks]---developed by students from my #link("https://roars.dev")[ROARS lab]---is a new web app that aims to help prospective students (and faculty candidate) explore the research strengths of CS departments and their faculty. It is _not_ a ranking system like CSRankings (but it uses its data and others like DBLP for publication information and OpenAlex for affiliation information), but rather a tool to help students find faculty and departments that match their research interests. It allows you see trends and growths of CS departments and faculty, such as the number of publications in different areas over time. It also lets you compare two schools or two research areas head-to-head (@fig:cspicks-compare), browse a "Discoveries" page of notable, data-derived trends (@sec:selecting-ranking-schools discusses using this to spot rising departments), and search which faculty and departments have NSF funding.
@fig:cspicks-gmu shows an example of CSPicks showing research areas of the CS department at George Mason.



#figure(
  grid(
    columns: (1fr, 1fr),
    gutter: 0.2em,
    image("files/cspicks1.png", width: 110%),
    image("files/cspicks2.png", width: 110%),
  ),
  caption: [CSPicks for George Mason.],
) <fig:cspicks-gmu>




// % Virginia Tech\red{$^*$}  \\

// %\autoref{tab:ranking} lists .

// % = Advisor Guide: Answers to Common Questions <chap:advising-guide}
// % Specific answers to questions about my advising guide in \href{https://roars.dev}{Roars Lab}. Adapted from \href{https://www.cs.columbia.edu/wp-content/uploads/2019/03/Get-Advisor.pdf}{this guide}.

// #pagebreak()
// = Frequently Asked Questions <chap:faq>

// #draftbanner(note: "These are a quick-reference digest of points made in depth elsewhere. Pull more from the Reddit/Facebook questions I keep seeing. Keep each answer to a sentence or two and link to the full discussion.")

// This is a quick-reference list of the questions I am asked most often. Each answer is intentionally short and points to the full discussion elsewhere in the book.

// #paragraph[Do I need an MS before applying for a PhD?][No. You can apply directly from a bachelor's degree (@sec:msrequirement). An MS can help but is not required.]

// #paragraph[Do I need a CS degree?][No. Many successful applicants come from Math, EE, Physics, and other fields (@sec:non-stem). What matters is evidence you can do CS research.]

// #paragraph[Do I need to take the GRE?][Usually no---most CS PhD programs have made it optional and it rarely matters (@sec:gre). A bad score can only hurt, so omit it unless it is strong.]

// #paragraph[Do I need publications?][They help a lot, but they are not strictly required (@sec:publications). Strong projects, letters, and research experience can substitute (@chap:research-experience, @sec:stand-out).]

// #paragraph[Is my GPA too low?][Probably not by itself. Grades are a weak signal (@sec:good-grades); research, letters, and an upward trend matter more (@sec:academic-recovery). Very low grades in Math/CS can be a red flag (@sec:why-rejected).]

// #paragraph[Should I email professors before applying?][It can help if done well (@sec:contact), but a generic or self-focused email hurts (@sec:kiss-of-death-emails). It is optional, not required.]

// #paragraph[How many schools should I apply to?][There is no magic number, but aim for a mix of reach, match, and safety schools (@sec:selecting-ranking-schools). Apply where there are 2--3 faculty you would want to work with.]

// #paragraph[Will I get funded?][At good R1 programs, CS PhD admission almost always comes with full funding---tuition, health insurance, and a stipend (@chap:funding). If an offer is _not_ funded, think hard before accepting (@sec:offer-letters).]

// #paragraph[I haven't heard back---is that a rejection?][Not necessarily. Schools notify in batches, some do rolling admission, and some keep students on a waitlist (@sec:late-rejection). No news is not bad news; be patient and avoid status-check emails.]

// #paragraph[I didn't get any interviews. Am I rejected?][No---many programs admit without interviews (@sec:no-interview). An interview is a good sign, but its absence is not a verdict.]

// #paragraph[Does ranking matter?][As a rough filter, yes; as a decision rule, no (@chap:rankings). Advisor fit (@chap:choosing-advisor) matters far more than a school's name.]

// #paragraph[Can I use AI to write my application?][Use it to edit and polish, not to write for you (@sec:using-ai). An obviously AI-written SOP is forgettable and can be a #alert[red flag].]

// #paragraph[What if I get rejected everywhere?][It is common, and not the end (@chap:not-accepted). Figure out why (@sec:why-rejected), strengthen your profile, and try again (@sec:try-again).]

#pagebreak()
= About <chap:about>

== About This Book <sec:about-this-book>
// \sectioninfo{This book aims to provide in depth information about the CS PhD admission process in the US. It is particularly useful for international students from smaller countries and less well-known universities as they often lack access to such information.}


#paragraph[History][This book was conceived during a lunch with a faculty member at GMU. We talked about why GMU was not able to attract good Vietnamese and other international students, despite having a much stronger CS program than many schools these students target (part of the reason is discussed in @sec:selecting-ranking-schools). We wished there were a way for international students to better understand PhD programs in the US.

I am also a member of the VietPhD group on Facebook and often browse forums like #link("https://www.reddit.com/r/gradadmissions/")[Reddit/gradadmissions] and #link("https://forum.thegradcafe.com/")[GradCafe]. I saw many questions from students about PhD programs, but most participants are students (often outside CS or outside the US), and answers are frequently inaccurate and confusing. So I thought a comprehensive guide focused on US CS PhD admissions from an insider perspective would be useful.

I started writing this book in May 2023 and have updated it since then (mostly around deadline when I procrastinate—#highlight[productive procrastination]). The book was initially intended for international students but has expanded to include advice for domestic students (e.g., @chap:domestic-students and @chap:fellowships).]


=== Who Is This Book For?

While this book can be useful for all students, it would most benefit *international students* from *smaller countries and less well-known universities*. It is also useful for *domestic students* from small US universities with no PhD programs or limited research opportunities (@chap:research-opportunities).

Students from top schools with strong research programs and experience might already know some of the information in this book. They likely have received guidance from their professors or grad students who have gone through the process. Students from smaller schools or countries, however, might not have access to such resources and know where to start.
My goal is thus to level the playing field by providing info that is not readily available to less privileged students.
#emph[I hope to encourage more students with such backgrounds to apply and succeed.]


#example-box[
  I was a first-generation PhD student and was very much on my own navigating the admission process---there was no one to ask for help, no Reddit, Facebook, or resources like this book.

  *Fun fact*: I was the first PhD student in my family and my extended family. My parents were war refugees and did not finish high school (though my dad eventually got his GED). I was the first one to go to college (Penn State), and then grad school. This helps inspire my cousins, and in total our family has 15+ Nittany Lions, several MS, 2 PhDs (me in CS and the other in Finance), and 1 MD. So, be the first and create a path for others to follow!
]
  

=== Why This Book (Instead Of Others)? <sec:why-this-book>

This book aims to be a comprehensive guide to the CS PhD admission process in the US.  It is based on my and other contributors' experiences. I try to explain _the reasons behind the admission process_.
While there are numerous #link("https://code.roars.dev/phd-cs-us")[resources online] that tell you _"what"_ to do, few explain the _"why"_---why LORs matter so much, why you should not draft your own LOR, why you should contact professors, etc. Moreover, it aims to help _international students_ who have very different backgrounds and experiences than domestic students (e.g., asking for LORs, research experience, cultural differences, etc.)#footnote([Though of course, domestic students often face similar challenges as international students, especially those from smaller schools or underrepresented groups.]).  Understanding the reason and mindset of the adcom and profs. can help you prepare better. 

This book is also a _#highlight[personal project]_ that I continuously update and refine, especially during the admission season. I also work on it when I procrastinate from research or other tasks---it's my way of telling myself that I am still productive!
Writing is a relaxing process for me, and I enjoy experimenting with new things in LaTeX and more recently Typst (@chap:writing-latex). Because of these reasons, this book is thus an ever-evolving project!

Finally, this book is highly _opinionated_ and _subjective_, which is both a strength and a weakness (see @sec:disclaimer).



=== How to Read This Book?
This book is designed to be read in any order. So you can start with any chapter that fits your current needs and stage in the application process. If you want the shortest route to understanding the book's admissions advice, begin with how I actually review an application (@sec:ievaluate); it explains why the later chapters emphasize specific LORs, concrete research evidence, a tailored SOP, and faculty advocacy. If you are still an undergraduate, start with research opportunities (@chap:research-opportunities). Domestic students can jump to @chap:domestic-students and fellowship advice (@chap:fellowships).

// % \begin{commentbox}
// % The angelfish on the cover, wearing a PhD cap, symbolizes the spirit of this book and its message. In an aquarium, the angelfish fish is considered the centerpiece of the tank and stands out from the rest---an important factor for a successful CS PhD applicant in a crowded and competitive pool of prospective students.\\

// % I also have angelfish in my aquarium, and they are my favorite. They live the longest and very resilient (e.g., to water quality)---which makes them a good metaphor for PhD prospective students.
// % I also like O'Reilly's books with their animal covers, so I thought it would be fun to have an animal cover for this book.
// % \end{commentbox}


// \paragraph{Notation} \autoref{tab:chess-icons} summarizes the notation and icons, inspired by chess pieces, used throughout the book.

// \begin{table}
//     \caption{Chess-based icon system for annotation types <tab:chess-icons}
//     \centering    
//     \small    
//     \begin{tabular}{cll}
//     \toprule
//     \textbf{Icon} & \textbf{Label} & \textbf{Description} \\
//     \midrule
//     \faChessPawn & Comment &  Pawns are plentiful; used for comments and side notes\\
//     \faChessKnight & Insight & Knights move in unexpected ways; used for surprising info.\\
//     \faChessBishop & Examples & Bishops are long-range pieces; used for examples and illustrations. \\
//     \faChessRook & QA & Rooks are straightforward; used for questions/answers\\
//     \faChessQueen & Key Ideas & Queens are powerful; used for summary or key ideas.\\
//     \faChessKing & Warnings & King is often under attack; used for warnings and cautions. \\
//     \bottomrule
//     \end{tabular}
// \end{table}
                 


== Contributing and Supporting This Book <sec:contribute>

This book will _always be free_ and _open source_ at
#emph-block[#link(mybookgithub)[#mybookgithub]]

If you spot an error, have a different experience, or want to suggest something, open an issue on the #link(mybookgithub)[GitHub repo]. Community input helps keep the book current and useful.

#paragraph[Supporting This Book][ 
You can support this book in many ways. The best way is to #emph[share it with others] who might find it useful, e.g., your friends, colleagues, or students.
You can also _link to it_ from your website or social media accounts. I was very happy to hear that it has helped many students, especially those from smaller countries---which is the main reason I wrote it.

You can also: 
- #link("mailto:tvn@roars.dev")[Send me] a _"Thank you"_ note and let me know how it helped you (those messages make my day!), 
- Give it a star ⭐ on its #link(mybookgithub)[GitHub repo],
- Buy the Kindle book on #link("https://www.amazon.com/dp/B0F41HP6Y2")[Amazon]. Note that I actually _do not_ think you should buy the book, which is free and more updated on GitHub. Making the Kindle version is just a fun experiment in self-publishing and allows me to brag about having a book on Amazon (priced at \$7.77---Unix/Linux 777 permission and the open nature of the book).
]

== About Me  <sec:about-me>

I am an associate professor in the CS department at George Mason University (GMU). 
Before GMU, I was at the University of Nebraska-Lincoln (UNL). Both UNL and GMU are #gls("R1") research universities in the US and have many international students in their CS graduate programs. I work in Software Engineering and Formal Methods. My research lab website is at #link("https://roars.dev")[roars.dev]. 

I have been involved in the PhD admission process at GMU and UNL for many years. This allows me to have a good understanding of the process, the challenges students face, and what faculty are looking for. Currently I am the program director of the MS program in Software Engineering at GMU (thus also have experience with MS admission, which is quite different than PhD as discussed in @chap:ms). I have also served on panels for PhD fellowships including NSF GRFP and DoD NDSEG, which allows me to provide insights on external fellowship applications (@chap:fellowships).

Though I was _not_ an international student, many of my students and collaborators are or were. I also mentor students from Vietnam and have close colleagues and friends who were once international students. I hope to capture the diverse challenges and experiences they have faced in this book so that it can be a valuable resource for prospective international students.
Finally, my upbringing in the US provides a perspective aligned with American culture, allowing me to shed light on various issues, particularly those related to cultural differences (@chap:cultural).

== Disclaimer <sec:disclaimer>

This book is inherently #highlight[_subjective_ and _opinionated_] based on my experience in PhD adcoms and student advising (@sec:about-me). Such a candid approach is beneficial, because overly neutral and "feel-good" advice are often useless and unrealistic in the competitive CS PhD admissions process.

Moreover, since PhD admission varies significantly across institutions, there's rarely a universal "correct" way, and too many choices often lead to confusion. Clear and direct guidance---even if opinionated---can provide practical pathways to navigate the complicated PhD admissions process better.

#example[This #link("https://roars.dev/phd-cs-us/advising.pdf")[advising guide] is another example of a highly subjective and opinionated document that I wrote for my current and prospective PhD students.]


== Acknowledgments

Many people have contributed to this book.
Profs. Craig Yu (GMU), Hakan Aydin (GMU), 
Xiaokuan Zhang (GMU), Hung Le (UMass), and Deepak Kapur (UNM) provided valuable input in the early version. Many students including Didier (GMU), Thanh (Melbourne), Hediyeh (Univ. of Tehran), and Dat (Melbourne) have contributed valuable questions and feedback (@sec:contribute).

Also thanks to NSF for encouraging faculty to be creative in research and education, which allows me to work on this book and other projects. 

Finally, thanks to my wife and kids for always supporting me and putting up with my long hours of work and writing.




//write quick def on postdoc; adjuct has limited affiliation; write about TA policies (e.g., 1 GRA 1 GTA etc)

// #pagebreak()
// = Additional Resources <chap:additional-resources>

// This book tries to be comprehensive, but it is still one person's (and a few contributors') take on the process (@sec:disclaimer). This chapter collects other resources---guides written by other faculty and students, GitHub repos and tools, and books about the PhD experience itself---that you might find useful alongside this book.

// == More Guides on Admissions <sec:more-guides>

// Many faculty and students have written their own admission guides, and reading a few different perspectives is useful, especially since advice sometimes conflicts (@sec:disclaimer explains why that is fine). A few worth your time:

// - #link("https://www.cs.cmu.edu/~harchol/gradschooltalk.pdf")[Applying to PhD Programs in Computer Science] by Mor Harchol-Balter (CMU)---one of the most widely circulated guides, especially strong on the mechanics of the application itself.
// - #link("https://parentheticallyspeaking.org/articles/us-cs-phd-faq/")[Getting a Computer Science PhD in the USA] by Shriram Krishnamurthi (Brown)---an FAQ covering many of the same questions as this book, from a different adcom's perspective.
// - #link("https://pg.ucsd.edu/PhD-application-tips.htm")[PhD application tips] by Philip Guo (UCSD), whose reviewing pace I mention in @sec:ievaluate.
// - #link("https://matt.might.net/articles/how-to-apply-and-get-in-to-graduate-school-in-science-mathematics-engineering-or-computer-science/")[HOWTO: Get into grad school] by Matt Might (Utah), whose LOR guide I also reference in @chap:LOR.
// - #link("https://csguides.github.io/grad-school-application-guide/")[Grad School Application Guide] by Weimer et al.---a crowd-maintained, open-source guide (fittingly, hosted on GitHub).
// - #link("https://jedyang.com/post/list-of-awesome-cs-phd-application-advice/")[Awesome CS PhD application advice] by Jed Yang---a large curated list of links in the same spirit as this section, but far more exhaustive.
// - #link("https://cs-sop.org")[CS-SOP], a database of real, anonymized SOPs from students who were admitted---useful for seeing the _range_ of acceptable structures (@chap:sop).

// #tip-block[These guides overlap with each other and with this book quite a bit---that convergence is itself a signal. When independent sources agree (e.g., "don't mass-email professors," "a specific LOR beats a famous name"), treat the advice as reliable regardless of which one you happened to read first.]

// == GitHub Repos and Tools <sec:github-repos>

// A few open-source projects worth knowing about, beyond CSRankings (@sec:csrankings) and CSPicks (@sec:cspicks):

// - #link("https://github.com/chinasatokolo/csGraduateFellowships")[Computer Science Awards, Scholarships, & Fellowships] by Chinasa T. Okolo---a maintained list of funding opportunities beyond NSF GRFP and DoD NDSEG (@chap:fellowships).
// - #link("https://github.com/jeanqasaur/academic-application-materials")[academic-application-materials] by Jean Yang---real SOPs, fellowship statements, and other application documents shared publicly by their author.
// - #link("https://github.com/jbhuang0604/awesome-tips")[awesome-tips] by Jia-Bin Huang (UMD)---bite-sized, illustrated advice on research, writing, presenting, and grad-school life generally, not limited to admissions.
// - The #link("https://github.com/dynaroars/dynaroars.github.io/wiki")[dynaroars lab wiki], which I sometimes point applicants to for specific questions, e.g., #link("https://github.com/dynaroars/dynaroars.github.io/wiki/Foreign-Top-Schools")[evaluating foreign universities] (@sec:selecting-ranking-schools) or #link("https://realgmucs.github.io/stats")[GMU's placement record] (@chap:choosing-school).


// == The PhD Grind: What It Actually Feels Like <sec:phd-grind>

// Everything else in this book is about _getting into_ a PhD program. It is worth reading at least one honest account of what happens _after_ you get in, so your expectations are calibrated before you commit five-plus years (@sec:phd-in-cs).

// #paragraph[The PhD Grind][#link("http://www.pgbovine.net/PhD-memoir/pguo-PhD-grind.pdf")[_The PhD Grind_] by Philip Guo is a free, roughly 100-page memoir of his six years as a CS PhD student at Stanford---probably the most detailed and widely-read account of what a CS PhD actually feels like, written by the same Philip Guo cited earlier (@sec:ievaluate) for his admissions advice. It does not sugarcoat the slow years, the abandoned projects, or the anxiety of not knowing whether the work will pan out.]

// #paragraph[The Illustrated Guide to a Ph.D.][Matt Might's #link("https://matt.might.net/articles/phd-school-in-pictures/")[short, illustrated essay] uses a simple picture---concentric circles of human knowledge---to explain what a PhD actually adds to the world: a small, specific bump at the edge of what's known. It takes two minutes to read and is one of the best explanations of _why_ the work is worth doing, even though from the inside it rarely feels like progress.]

// #paragraph[A PhD Is Not Enough][Peter Feibelman's book #emph[A PhD Is Not Enough: A Guide to Survival in Science] is older (physics-focused, first published in 1993) but still widely recommended for its practical advice on picking an advisor, giving talks, and navigating a research career---topics this book only partially covers, since it mostly stops at admission.]

// #caution-block[None of these accounts should talk you out of applying. The grind is real, but so is the payoff, and the difficulty is exactly why @chap:choosing-advisor and @sec:phd-in-cs matter so much: a good advisor and honest expectations make the grind survivable, and often enjoyable.]

#pagebreak()
= Templates and Samples <chap:templates>

//#draftbanner()

This appendix collects concrete starting points for the materials and emails discussed throughout the book. #alert[A warning before you use them:] these are _skeletons_, not scripts. The entire point of an application is to customize it to your own voice and experiences. If you copy these word-for-word, you will produce exactly the generic, forgettable material that adcoms (@sec:adcom) reject. Use them to see the _structure_, then fill them with your own specifics.

== Email to a Potential Advisor <sec:tmpl-contact-email>

Keep it to 3--4 short paragraphs, plain text, no fancy formatting (@sec:kiss-of-death-emails). The goal is to show you did your homework and to say something only _you_ could say (@sec:contact).

```
Subject: Prospective PhD applicant interested in <specific topic> (Fall 2026)

Dear Prof. <Lastname>,

I am <name>, a final-year <BS/MS> student in <field> at <university>.
I read your recent paper "<exact title>" on <specific topic> and was
particularly interested in <one concrete, specific point>. <One sentence
connecting it to something you did: a project, a course, a paper.>

In my <project/thesis/internship>, I <one or two sentences on what you
built or found and the result>. This is why I am drawn to your group's
work on <area>, and I am applying to <university>'s CS PhD program this
fall with the hope of working with you.

I have attached my CV. I would be grateful for any thoughts on whether my
background is a fit for your group. Thank you for your time.

<Name>
<link to website / Google Scholar / GitHub, if relevant>
```

#caution-block[Do _not_ mass-email, CC/BCC multiple professors, attach transcripts, use flowery greetings, or follow up with a phone call (@sec:kiss-of-death-emails). If the professor's website lists contact instructions, follow them exactly.]

== Asking for a Letter of Recommendation <sec:tmpl-lor-request>

Ask _early_---at least 3--4 weeks before the deadline (@sec:asking-LOR)---and give the writer an easy way to say no.

```
Subject: Request for a recommendation letter for PhD applications

Dear Prof. <Lastname>,

I am applying to CS PhD programs this fall and would be grateful if you
would be willing to write me a strong letter of recommendation. I really valued <specific experience: the research project, the course, the work> and felt you knew my <research ability / work> well.

I completely understand if you are too busy or do not feel you can write a strong letter. If you are able to, I will send you everything you need: my CV, draft SOP, a short summary of what we worked on together and my achievements, the list of schools with deadlines, and the submission links.

Thank you very much for considering this.

Best,
<Name>
```

#tip-block[Notice the phrase "_strong_ letter" and the explicit out. You _want_ to give writers an easy way to decline, because a lukewarm letter hurts more than a missing one (@sec:generic-letters). Once they agree, make their job easy (@sec:help-your-LOR-writers).]

== Information Packet for Your Letter Writers <sec:tmpl-lor-packet>

Once a writer agrees, send a single, well-organized message (or document) so they can write a specific, detailed letter (@sec:help-your-LOR-writers).

```
- Updated CV and (draft) SOP.
- A short reminder of our work together: project name, your role, what you
  did, the outcome, and any specific moments worth highlighting (a bug you
  found, an idea you proposed, how you handled a setback).
- 2-3 points you'd love me to emphasize (e.g., independence, persistence, other research experiences).
- A table of schools: name, program, deadline, and submission link/method.
- How letters are submitted (portal upload vs. email).
```

== Statement of Purpose Skeleton <sec:tmpl-sop>

A SOP is roughly 1--2 pages. There is no single correct structure, but a reliable one is below (@chap:sop). Tailor the closing to _each_ school by naming specific faculty (@sec:contact).

```
1. Hook + focus (1 short para)
   A specific moment or problem that drew you to research---NOT "I have
   always been passionate about computers." End with the area you want to
   pursue.

2. Research experience (1-2 paras, the core of the SOP)
   For each project: the problem, what YOU did, the result, and what you
   learned. Concrete > grand. Show research ability, not just coursework.

3. Why a PhD / your direction (1 para)
   What questions excite you and where you want to push. Demonstrates you
   understand what research is.

4. Fit: why THIS school (1 para, customized per school)
   Name 2-3 faculty and ONE specific thing about each that connects to your
   interests. This paragraph changes for every application.

5. (Optional) Brief context (1-2 sentences)
   Any necessary explanation of a gap or weakness---factual, no excuses.
   Often better placed in a diversity/additional-info statement instead.
```

#caution-block[Avoid the SOP "kiss of death" (@sec:kiss-of-death-sop): vague passion, listing coursework, flattery, generic statements that could be sent to any school, and obvious AI boilerplate (@sec:using-ai). The single best test of a SOP paragraph is: _could anyone else have written this exact sentence?_ If yes, rewrite it.]

#pagebreak()
= Glossary <chap:glossary>
#print-glossary(entry-list, show-all: true)

#pagebreak()
#emph-block[#align(right)[_Last Updated: *#datetime.today().display("[year]-[month]-[day]")*_]]
