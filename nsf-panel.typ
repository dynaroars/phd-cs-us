
#set page(numbering: "1", number-align: center)
#set heading(numbering: "1.")
#set text(lang: "en", size: 11pt)
#set list(indent: 1em)
#set enum(indent: 1em)
#show ref: set text(fill:blue)
#show link: it => text(fill:blue, underline(it))
#show heading: set block(above: 1.4em, below: 1em)

#set document(
    title: "Advisor Guide: Answers to Common Questions",
    author: "ThanhVu Nguyen"
)
#set par(justify: true)

#import "@preview/theorion:0.6.0": *
//#import cosmos.simple: *
#import cosmos.fancy: *
//#import cosmos.rainbow: *
//#import cosmos.clouds: *
#show: show-theorion


#emph-block[These notes are accumulated from my experience and reflections. I usually work on it when I am writing my own proposal or reviewing other proposals, and just want to write down my thoughts as they are still fresh in my mind.]


= Submission Process and Timeline 

  
== Submission and the role of OSP
Your *Office of Sponsored Program* (OSP) or some equivalent unit will submit your proposal to NSF (through #link("https://research.gov")[research.gov]). You will need to work with them to submit your proposal.  Several things to pay attention to:
  - OSP often has their internal deadline, which can be a few days to a couple of weeks (for large universities with many proposal submissions) before the actual proposal deadline. In such case, OSP often ask you to submit everything to them or upload directly to research.gov by their internal deadline.
  -  During the proposal writing process, OSP mainly helps with the budget and budget justification based on your input. If the proposal is collaborative, they will also help with the sub-award budget and justification.
  - After sending materials to OSP, they check compliance with NSF's requirements (e.g., formatting, font size, page limits, required sections, etc). This is because NSF can return your proposal without review if it doesn't meet the requirements. OSP typically will not check the technical content of your proposal.
  - OSP can submit your proposal any time after their internal deadline and before the actual proposal deadline (so don't assume they will submit on the day of the actual deadline, they might submit a few days before).
  


== Assignment to a Program Manager
After OSP submitted your proposal, it will be assigned to a program manager (PM) in the relevant NSF directorate and division. 
- During the submission on research.gov you will select a program, but a program can be quite large (e.g., Software and Hardware Foundations (SHF) program in the Computer and Information Science and Engineering (CISE) directorate), so your proposal will be further assigned to a program director or manager (PM) within that program, typically those that are most relevant to your proposal, e.g., _by looking at the title and (the 1-page) summary of the proposal_ (#highlight[so make sure the title and summary are clear and informative about the topic of your proposal]). 
- At some point after the proposal is submitted, you can check the status of your proposal on research.gov, and it will show you the name of the PM who is handling your proposal.
- From here on, the assigned PM will be the one who handles your proposal, e.g., they will select the reviewers, run the panel meeting, and make the funding recommendation. 

#note-block[Recently, due to shortage of PMs, a PM can take proposals in programs that are not exactly in their area of expertise. However, this is still OK because the selected panelists will be experts in the topic of the proposal and just as with any proposal (even those where the PM is an expert), the PM will rely on the panelists' expertise to make the funding decision.
]


= Panel Selection and Review

PMs will select panelists to review your proposal. 
- The size of the panel vary, e.g., most standard CISE panels have under 10 panelists, but specific ones like the GRFP panel can have 50+ panelists. However, in general, each proposal is reviewed by *3 panelists*.
- PM selects reviewers based on various factors, including technical expertise and diversity (e.g., mix of junior and senior researchers, R1 and R2 institutions, different geographic locations).
- *Conflict of interest (COI)* is a major factor in selecting reviewers (e.g., the reviewer should not also submit a proposal to the same program). In fact, even after the panel is selected, if any potential COI is discovered, the PM will remove the reviewer and assign another one.
- Occasionally, if there is not sufficient expertise in the panel, the PM might reach out to an external reviewer (who is not on the panel) to review your proposal. These are *"ad hoc"* reviewers, and they typically only review one proposal and do not participate in the panel discussion.

#note-block[NSF review process is *single-blind* (i.e., the reviewers know the the PIs, but the PIs do not know the identity of the reviewers). The PIs sometimes try to guess who the reviewers are based on the comments, but this is often not accurate and leads to unnecessary stress.
]

= Panel Meeting and Discussion


#note-block[Due to the pandemic, panels have been held virtually, and this is likely to continue for the foreseeable future. In addition, due to recent changes in having _shorter panel summary writing_, panel is now typically held in one (long) day instead of two days.
]

== Category of Proposals after Panel Discussion
Typically there are three categories of proposals after the panel discussion: Highly Competitive (or HC), Competitive (or C), and Not Competitive (or NC). HC means it is likely to be funded, C means it is good but might not be funded, and NC means it is not recommended for funding. 
-




= After the Panel Meeting: Recommendation and Timeline
 - Competitive (C) is the gray area, and this is where the PMs will make the final decision on which proposals to fund based on the panel's recommendation and the available budget. Obviously, C proposals that were ranked very high has better chance. However, if everything is equal, the PM might also consider other factors such as the proposal's topic, the PI is new and or has not been funded before, EPSCOR state, etc.  These are decisions made _after_ the panel meeting (though discussions and reviews during the panel meeting might also touch on these factors), and based on the PM's judgment and experience.

- *Budget adjustment*: the PM might ask the PIs to adjust the budget of the proposal (e.g., reduce the budget if the panel thinks the proposed work can be done with less budget). This also helps the PM to fund more proposals with the available budget.
However, this is likely based on the suggestion from the panel as the PM rarely makes this decision on their own.



#remark-block[While being rare, it is possible that an HC proposal is not funded, e.g., if there are too many HC proposals and the budget is not sufficient,  or if there are multiple HC proposals that are very similar and the PM can only fund one of them, etc.
]


= General Issues in Proposals

== Assumption that the reviewers are knowledgeable

Usually experienced proposal writers do not have this problem, but new proposal writers sometimes assume that the reviewers are knowledgeable about the topic or field. The truth is reviewers, while work in your general area, might not be familiar with your specific topic.  For example, they work in the area of _Software Engineering_ or _Formal Methods_, but they might be familiar with topics such as _gradual refinement type_ or _neural network verification_.

Thus, your job is not to convince the small group of people who work in your topic (well they probably already like your work, or hate it), but to convince the more general reviewers who are not experts in your topic that your work is important and worth funding (now imagine those reviewers in turn need to convince the NSF program officers who are also not experts in your topic, who in turn need to convince the NSF director who is even less familiar with your topic).  

#highlight[So motivate, use examples to demonstrate, and explain your work in a way that is accessible to a general audience. Better yet, have someone who is not an expert in your topic read your proposal and give you feedback on whether they understand the motivation, the problem, and the proposed solution. Usualy they just need to read the introduction to give you this feedback.
].

#rect[In my experience, proposals that are a bit heavy on foundations and theories often have this problem.  This could be a cultural issue in some research communities (e.g., theoretical papers often start with some very technical theorem or definition and the reviewers are expected to understand and able to follow them).]

== Lack of clear motivation or problem statement.


== Lack of convincing prior work or preliminary results or PIs' expertise in the area.
- Get collaborators (and include letters of support from them)

=== Wall of text or tons of formulae

=== Insufficient Evaluation Plan


== Generic Broader Impacts or Education Plan
  - be specific ! give concrete examples ! numbers, stats, names, etc  . You are more responsible and credible when you are specific.




Most of the stated issues appear to be commonly faced problems in gen AI (e.g., only part of the media is AI generated,  updating existing detectors to handle new data etc)  and there should be many work on these; yet the proposal only briefly cite some work but didn't discuss why they fail or how the proposed work is different
While  the zero-shot gen ai video detection section in Aim 1.1 explicitly mentioned videos are quite different than images a and proposed work specifically for video, most other aims/tasks treat them as equivalent and essentially apply the same techniques to both images and videos, which is not convincing.  


== Proposal Summary
- Very important -- read not only by the PIs but also by the reviewers and program officers, board of visitors etc .
- Can include things not in individual reviews but brought up during the panel discussion
- Can be more than 5 sentences (10 sentences etc are fine too).  



= Misconceptions and Common Mistakes



== Proposal from top universities or well-known researchers have a higher chance of being funded

In my experience, this was *never* the case in NSF panels.  I do not at all pay attention to whether a proposal comes from a top university or a well-known researcher.  This is also the general feeling I have from other co-panelists. 

That said, well-known researchers or those at top universities often have more experience in writing proposals (e.g., they have successful mentors who can guide them through the process) and have higher credentials (e.g., published multiple papers at good places on the proposed topics) compared to less experienced researchers or those at non-top universities. These factors---well-crafted proposals and strong prior/prelim results---can give them an advantage. 

So it might appear that proposals from top universities or well-known researchers have a higher chance of being funded, but this is actually due to their proposals are simply stronger, not because of their reputation or institutional status.




== Theoretical work has a disadvantage in proposals

While at surface it might appear that theoretical work is at a disadvantage in proposals, in my experience this is often not because people prefer applied work over theoretical work.

This is mainly because theoreticians or mathematicians often write proposals that are dense in technical contents (wall of formulae and theorems) and often fail to clearly communicate the motivation, problem, and proposed solution.  So when the reviewers do not understand the technical details or cannot follow the logical flow of the argument, they may dismiss the proposal without fully appreciating the theoretical contributions. 

It is also true that more applied work tends to have more immediate practical and broader impacts (e.g., can be argued to solve real-world problems or have applications in industry or society). This makes it easier for reviewers to see these broader impacts and understand why the work is valuable. That said, in my experience, the main reason is stated above: it's the writing and communication of the proposal that is the issue, not the nature of the work   itself.

In short, I and many other reviewers, who do not focus on theoretical work, have advocated for theoretical foundations in many panels and absolutely have no bias against theoretical work.
In fact, after reading so many applied proposals that claim to address real-world problems or have immediate applications, I actually want to see more theoretical work. So the key is to ensure that the proposal clearly communicates the motivation, problem, and proposed solution in a way that is accessible to reviewers who may not be experts in the specific theoretical domain. 




-----

The NSF reviewing process

The process

The typical NSF panel I've seen is composed of about 1/4-1/3 people who have worked in the area at one point in time, but may not be active/publishing, about 1/4-1/3 people who are in related fields, and the rest actively working in at least the broad area. Some program managers are better at recruiting people, and you may get lucky and have everyone be an active researcher. You probably have about a 30% chance of having someone who really knows your specific area read your proposal. You'll probably get one person who at least keeps up on the research in your area, even if they don't work in it themselves, and one person who knows very little about your area. On rare occasions the program manager will get an external reviewer (who isn't on the panel) to review it - this usually happens when your area is a bit further afield than normal.

Each proposal is (usually) read by 3 or 4 people. Sometimes it will be read by more for one or more reasons:

    Someone on the panel decided to read it, just because it looked interesting from the title/abstract, even though it wasn't assigned to them.
    Someone on the panel (on the day of the meeting) volunteers to read it. This can happen because of a conflict of opinion amongst the assigned reviewers, or because, while listening to the discussion, they decided they might have an opinion.
    If your proposal crosses disciplines, it will typically have an extra reviewer or two from another area.

Each reviewer is suppose to read the proposals before the meeting, and enter comments. A typical review load is 5-15 proposals, and, while some reviewers try to read them all the night before (!) usually they'll be read over two weeks to a month or so.

The reviewers don't see each other's comments (typically) until the day of the meeting.

The day of the meeting, each proposal is discussed in turn, and the proposals categorized as Highly competitive (Really Good, very likely to be funded), Competitive (Good -we like them although they have some flaw, but probably won't be funded unless money falls out of the sky), Low competitive (the idea's good - try again after fixing major flaws) and Not Recommended for funding (reject - don't even bother re-writing it). (The ranking scheme may vary a bit - but usually the proposals are grouped as they're discussed into roughly these conceptual categories.) If your proposal ended up in the Really Good category (and typically only about 1/10 do) then you will be likely be funded, barring any unusual circumstances. These proposals are usually ranked by the reviewers with Excellences and the occasional Very Good. Of the proposals in the Good category, the top one or two might be funded, if congress is generous this year.

The program chair listens in on the discussion, and provides guidance on the procedure, but basically doesn't contribute to content discussion. He/she has the final say on what gets funded. I think they generally follow the advice of the panel, but as I've never checked to see if the proposals we ranked highly were funded, I can't tell you if this is indeed the case. I have heard of at least one occasion where the program chair killed an excellently ranked proposal because "it wasn't in an area I was interested in" (he was retiring that year...). But (hopefully!) this sort of thing is rare.

Note: Some small proposals (especially from under-represented schools/states) may get funded even though they weren't in the top 1/10 (but they better be ranked well). This is because there's other pots of money to draw from in this case (e.g. EPSCOR states). And (I think) a small proposal might just slip in to fill in the chinks in the budget.

After the first day everyone comes back and the proposal ranking is gone over again with a fine-toothed comb, with some proposals shuffling up and down. Then everyone sits down and writes panel summaries which try (with mixed success) to capture the flavor of the oral discussions.

How this affects your proposal review.

    The reviewer will remember, at best, your research area, a basic idea of your proposed research plan, and any unusual collaborative efforts. But that's only if you make a concerted effort to clearly lay out those points in the first two pages.
    They will definitely remember if:

    The writing was bad/confusing/full of errors.
    You didn't do what you said you were going to do in the first two pages.
    You missed out someone else's research you should have been aware of.

    You should do your best to make sure they remember:

    That you did an excellent job describing the current state of research in your area, and what the open problems are.
    That you clearly laid out a list of problems and potential solutions.
    Moreover, you included a summary of those problems in an easy-to-find place so the reviewer can find it again when needed.
    You thought about the broader impact and education components.
    (If applicable) That you have thought out how to evaluate your research, and/or apply it to real problems.

How the composition of the panel affects your ranking

If someone on the panel works in your area, this can be either a Good thing, or a Bad thing. But it will definitely affect your ranking, because the remaining panelists will defer to the person who "knows what they're talking about".

On the plus side: If you really do have a good idea, but maybe you haven't presented it as clearly as you might, or argued why this is an important research topic, a knowledgeable reviewer can help.

On the down side: If the reviewer doesn't think much of your idea, they can kill it. The reviewer's arguments will be one of the following: "I/someone tried this x years ago and it failed", or they may present technical reasons, or they may say you didn't cite some relevant work. To combat this, I suggest the following:

    If you've got demonstrable results, include them and, more importantly, make sure they're easy to find/stand out from the body of the text.
    Make sure your "why this research is important" and "why this approach will succeed" sections are clearly understandable to someone who is (presumably) reasonably intelligent, but not versed in your area.
    Include enough detail to convince someone in your area that you know this material cold, and that your solutions will work. The real reason for this section is so that the semi-knowledgeable reviewer (who likes your proposal) can point to that section and say "this looks really convincing - explain to me why this isn't convincing you".

People outside of your area will primarily judge your proposal on the first two pages, the outreach section, and on how well the proposal is written (does it flow, are the non-technical arguments convincing). I have seen a proposal that was very well-written, but somewhat slim on technical merit, get funded because the three reviewers were not knowledgeable in the area. And, in general, a well-written proposal will get higher marks from less-knowledgeable people simply because that's the only thing they have to judge the proposal on.

Of course, this means that if your proposal is dense, full of jargon, and lacks compelling, easily understood arguments, it will get lower marks. If you're working in an area where the problems are not so obvious (e.g., if you work with robots, you know it is stunningly difficult to get a robot to roll down a corridor, but the average computer science researcher doesn't think this is a hard problem because they walk down corridors all the time, so how hard can it be...) then you're going to have to spend some time convincing the reviewer that this is actually a problem, and that the current solutions are not good enough.

Why proposals aren't funded

The following are the most common rejections I've seen. They come in pairs, more or less, with a good proposal balancing between the two.

    It's already been done.

    This usually happens with a proposal where the PI is new to the field, and just plain missed an entire body of research (possibly because it came under a different name in another field). Usually the review will be a kindly one, and simply say "go look at this work".
    It also happens (sadly enough) to new proposal writers because they didn't do a literature search. Please, do your homework.
    Sometimes this arises because of a mis-understanding of the proposed research, and a mis-remembering of what's been done. The best way to combat this is to make sure you've touched on all related and are explicit about what you're doing that they didn't.

    Not enough detail/vagueness

    This usually arises because the PI just plain hasn't figured out how they're going to proceed. If the reviewers liked the problem area and the approach, then this proposal is a very good candidate for thinking/working on some more, and re-submitting.
    You may argue that, if you knew how to do something, you wouldn't be asking for money to do it.. Don't confuse not knowing how to do something with not enough detail. For example, I don't know what roads to take to get from St. Louis to New Orleans, but I do know enough to pop-up Google Maps and get driving directions, and that there's probably a north-south freeway that parallels the Mississippi, and that it will take a day or two to get there.
    Be concrete about the problem statement and evaluation, even if you're not quite sure of all of the details on the approach. A poorly detailed problem statement is death to a proposal.

    There's not enough research/nothing new

    This is slightly different than it's already been done. I usually see this with research ideas that have reached the point where most of the things left to do are fairly straight-forward, or just require an application of existing, known techniques. Yes, engineering/follow through is important, but it's not what NSF funds.
    There's usually no fixing this sort of proposal. It may, however, make a great start/first third of your next proposal.

    Too ambitious

    I know of several cases where the research in a proposal that got rejected as "too ambitious" was mostly completed in the following year... I think the way to avoid this review is to include at least a few pages of fairly short-term goals that are clearly achievable. Then you can be pretty ambitious in the rest of the proposal.
    You may have oh-so-many ways to tackle the problem, and there's so many different ways you could use your work… that's GREAT, give some feel for the breadth of problems/approaches out there, then PARE the problems/approaches down to something that matches the amount of work you can do in 3-5 years.

    Lack of evaluation/no application

    This happens if the reviewer thinks you're solving a non-existent problem, or if your proposed solution won't be any better than existing solutions.
    If your work is just too far from being usable (yet) in a real-world application, at least come up with compelling test cases and evaluation criteria.
    Think about how to evaluate your solutions/approaches. 

    Poorly written

    There are services you can hire that will help you clean up your writing. If you aren't a native speaker, or you don't write well, use them. Most universities have a writing center as well.
    Write the proposal early, let it sit, and go back to it.
    Don't cobble together bits and pieces from papers and expect it to flow.
    If you're working with multiple PIs, designate someone as the coordinator and make sure everyone's reading everyone else's part.
    Get other people to read it.

    Technical flaws/panel doesn't think this will work

    It could be that you didn't explain your approach well enough, but more likely you're trying an approach to an existing hard problem that isn't likely to be solved with your (usually naive) approach. The only fix for this is preliminary data that shows your approach will work, or a re-working of the problem statement to bite off a smaller chunk that you're more likely to succeed in doing.

    Just not compelling/exciting

    This is a hard one. A proposal can be well-written, have a solid technical approach, and still not excite anyone. The best fix for this is to find a compelling broader application (or a novel technical approach, but application is usually easier).  

    == How to make a reviewer unhappy
    Don't spell check. Change formatting halfway through the paper. Use really small text. Don't check your figure numbers and captions. Use equations without defining the variables. Bounce around from subject to subject. Claim you're going to do x then actually describe y. List all of your achievements and describe all of your current research and spend one page describing new work. Define 20 equations without any accompanying text. Make it really difficult to dig out the broader impact, intellectual merit, and proposed work. Ask for tons of money for lots of students to do very little work. Assume your reviewer knows your field intimately, and jump straight to the details. Cut and paste three existing proposals from different people into one proposal, and add a summary page that "glues" the result together. 


= Reporting and Post-Award Management

== Reporting Requirements
- _Annual reports_: typically due every year on the anniversary of the award. 
    - Should indicate _what's new_ since the last report, and what are the plans for the next year.
    - *Participant* (what individuals have worked on the project): 
       - _Nearest Person Month worked_:  a month is 160 hrs (40 hrs/week \* 4). If a student works for a full semester (e.g., from August --- December or January --- May), then they have worked for a bit less than 5 months (though can round to 5 months as the system doesn't allow fractional months). #highlight[However, if the student is capped at 20 hrs/week, which is often the case for PhD students,] then they have worked for 2.4 months (20 hrs/week \* 4 weeks/month \* 5 months = 400 hrs), which is then #highlight[2 months].


- _Final report_: typically due within 90 days after the end of the award.
    - Should indicate what's new since the last report (but of course no plans for the next year since the award is ending).
- _Outcomes report_: typically due within 90 days after the end of the award. It is shorter (2--3 paragraphs) focuses on the outcomes and impacts of the project.  In addition, just like the _abstract_, the outcomes report is often public-facing, i.e., shown on the public NSF website for the award below the _abstract_, and so should be written for the general public.


== No Cost Extension
If you need more time to complete the project, you can request a no-cost extension (NCE) from NSF. This allows you to extend the project period without additional funding. 
- NCE duration: typically up to 1 year, but can be shorter (e.g., 6 months) if you only need a short extension.
- The first NCE is typically granted without much issue.  However, for the second NCE, you will need to provide a justification for why you need the extension and what you have accomplished so far. 
- To request an NCE, first check with your institution's OSP to see if they have any specific requirements or forms that need to be filled out.


= Notes

== Terminologies:
- *Review Writer*: you are assigned to review and write a review for this proposal.
- *Scribe*: you are a *reviewer writer* of this proposal and you will write the *panel summary* for this proposal.
- *Panelist*: you don't need to review this proposal, however you can (and should) participate in the panel discussion of this proposal and provide your comments and feedback to the *review writer* and *scribe*.

== Checklist
- Too much assumptions about the reviewers' knowledge
- Lack of clear motivation or problem statement
- Lack of convincing prior work or preliminary results or PIs' expertise in the area
- Wall of text or tons of formulae
- Insufficient Evaluation Plan
- Generic Broader Impacts or Education Plan


