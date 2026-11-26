#import "@preview/theorion:0.6.0": *
//#import cosmos.simple: *
//#import cosmos.fancy: *
#import cosmos.rainbow: *
//#import cosmos.clouds: *
#show: show-theorion


//#set page(numbering: "1", number-align: center)
#set heading(numbering: "1.")
#set text(lang: "en", size: 11pt)
// #set link(style: text.with(fill: blue))
#set list(indent: 1em)
#set enum(indent: 1em)
#set page(margin: 1in)

#set par(justify: true)
#show ref: set text(fill:blue)
#show link: set text(fill:blue)
#show link: underline

//#show quote: set pad(left: 1.5em)
#show quote: set text(style: "italic")

#show heading: set block(above: 1.4em, below: 1em)

#set smartquote(enabled: false)
#show title:set text(size: 17pt)
#show title: set align(center)
#let title = [Lab Manual]
#let author = [ROARS, George Mason University]

#let dark-green = rgb("#006400")
#let light-green = rgb("#d4f1d4")

#box(
  stroke: (paint: dark-green, thickness: 3pt), inset: 2em, width: 100%, height: 100% )[ #align(center + horizon)[ #v(0.5fr) #text(size: 32pt, weight: "bold")[#title]
    
    #v(0.5fr)
    
    #image("files/dino.png", width: 80%)
    
    #v(1fr)
    
    #text(size: 18pt, weight: "bold")[#author]
    
  ]
]

// Inline code
#show raw.where(block: false): it => box(fill: rgb("#f0f0f0"), inset: (x: 2pt), radius: 2pt, it)

// Code blocks
#show raw.where(block: true): it => block(fill: rgb("#f0f0f0"), inset: 10pt, radius: 4pt, width: 100%, it)

#pagebreak()


#quote(block: true, quotes: false)[
This manual, inspired by #link("https://mehr.nz/pdf/2020_Mehr_Biologist.pdf")[Mehr's 2020 biologist manual], serves as a guide for prospective and current members of #link("https://roars.dev")[Roars Lab]. It outlines the lab's policies, procedures, and expectations to ensure a productive and collaborative research environment.

#strong[Updating the manual]: The manual now lives in the #link("https://github.com/dynaroars/dynaroars.github.io/wiki")[Roars Lab wiki]. Lab members, who all have write access, are encouraged to provide feedback and suggest changes to improve its clarity and usefulness.
]

= Contents

- #link("https://github.com/dynaroars/dynaroars.github.io/wiki/Lab-History-and-Members")[Lab History and Members]: history, current members, and alumni.

- #link("https://github.com/dynaroars/dynaroars.github.io/wiki/Lab-Resources")[Lab Resources]: weekly lab meeting, web links, Discord, poster printing, independent study, and contact information.

- #link("https://github.com/dynaroars/dynaroars.github.io/wiki/Servers")[Servers]: server specs, getting an account, and usage tips.

- #link("https://github.com/dynaroars/dynaroars.github.io/wiki/GMU-Network-Access")[GMU Network Access]: VPN access requests, VPN setup, and eduroam.

- #link("https://github.com/dynaroars/dynaroars.github.io/wiki/Research-Practice")[Research Practice]: authorship policy, venue selection, data and code management, and acting on opportunities.

- #link("https://github.com/dynaroars/dynaroars.github.io/wiki/Writing-Papers")[Writing Papers]: writing style, file organization, writing order, sending drafts, rebuttals, and presentations.

- #link("https://github.com/dynaroars/dynaroars.github.io/wiki/Travel-and-Reimbursement")[Travel and Reimbursement]: conference registration, reimbursement, per diem, and car rental.

- #link("https://github.com/dynaroars/dynaroars.github.io/wiki/PhD-Defense")[PhD Defense]: comprehensive exam and defense procedures.

- #link("https://github.com/dynaroars/dynaroars.github.io/wiki/Recommendation-Letters")[Recommendation Letters]: asking for, writing, sending, and following up on letters.

- #link("https://github.com/dynaroars/dynaroars.github.io/wiki/New-Faculty")[New Faculty]: getting started at GMU and the Premium Reward health plan.
