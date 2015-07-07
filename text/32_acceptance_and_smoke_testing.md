## Acceptance and Smoke Testing

### Smoke Testing

My father is a plumber.  Before connecting the pipes in a new building to the water main, he sends smoke through the pipes, and looks around to see if any smoke has escaped from the pipes into the building.  Why does he do this?  Well, if there are any leaks, it's much easier to clean up smoke (since you just let it dissipate) than water.  It's much more noticeable if smoke is filling up a room, compared to checking if there is any wetness behind the walls.  It's much faster than inspecting all of the piping inch by inch, yet provides similar information.  Once the smoke test has been passed, the water can come in and further, more specific testing - e.g., ensuring the correct pressure at different floors - can commence.

Smoke testing in software is similar.  A __smoke test__ involves a minimal amount of testing that can be done to ensure that the system under test is ready for further testing.  It can be thought of a guard to further testing - unless the system can perform some minimal operations, you don't move on to run the full test suite.  This is usually a small number of tests, checking that the software can be installed, that major functionality seems to work, and no obvious problems appear.  For example, if you are testing an e-commerce site, you may check to see that a user can access the site, search for an item, and add it to their shopping cart.  The full test suite would check numerous edge cases and paths, as well as all of the ancillary functionality such as recommendations and reviews.

Why bother performing a smoke or sanity test before a full test suite?  Wouldn't you eventually find all the same problems without it?  In all likelihood, yes, but the key word is _eventually_.  Smoke testing allows you to determine if the software is even worth testing before running the full test suite on it.  There is often a cost associated with setting up a system for testing, such as installing software on servers and clients, looking up test plans, and generating test data.  If the software is so broken that it doesn't even support basic functionality, then smoke testing can prevent you from spending time doing all of the other work involved in running a full test suite.  

As a real-life example, I once worked in a location where we had weekly releases of software mornings that would be installed in a lab consisting of approximately fifteen different computer systems.  Installing the software and updating the testing data for the new version - even with a custom-built over-the-network script - usually took several hours.  However, often that week's version of the software had so many defects, or such bad ones, that it was essentially untestable (errors such as constant data corruption or an inability for users to login).  Instead of determining this after a morning of installing and upgrading, we were able to run a quick smoke test and find them first thing in the morning.  This gave the testers extra time to work on something else (e.g., developing test scripts or automation tools) and the developers earlier notice that there was a problem with the software, which meant that a fix for the defect would be found earlier.

Smoke testing can be either __scripted__ or __unscripted__.  In unscripted testing, an experienced tester or user just "plays around" with the software for a little while before the actual testing occurs.  This is usually done by a tester or other person experienced with the software, so as to ensure that the most important functionality is tested, known defects have been fixed, and the software behaves as it shoud in general.  Scripted testing means that there is a specific test plan that specifies the test cases to be executed.  While scripted testing provides a much more regulated environment and helps to keep track of what has been shown to work, unscripted testing is much more flexible and allows testers to check different aspects of the software for different releases.

A variant of smoke testing used in development is __sanity testing__.  Sanity testing is an even more reduced version of smoke testing, where only an absoutely minimal amount of checking the software occurs.  It is often unscripted, or, if scripted, has only a few test cases.  It checks that the software runs and that main functionality is working, but does not go into edge cases or off the happy path.  For example, sanity testing a compiler might be to check that it can compile a "hello, world" program and that the resulting executable does in fact print out "hello, world".  It would not include checking what happens when there are complex Boolean expressions, or if a referenced library is missing, or that an unparseable program will produce the appropriate error message.  It just determines that the system is able to perform basic functionality.  This is often useful when a system should either work entirely or not at all, such as when installing a piece of software on a new architecture.  If the code is compiled incorrectly, there is a good chance the software will fail to start.  Sanity testing will allow to bypass all of the work of setting up an appropriate test environment if the software doesn't work at all.

An even milder version of smoke testing is __media testing__.  This is a check that all the relevant files have been written to the storage medium correctly and can be read.  It's just a final double-check that the CD was not corrupted before sending it to the customer, or that the files that were put on the server were written to the correct directory.  This can be as simple as checking that the files on the medium are bitwise equivalent to the files in the original location, or could involve some very minor work after that, such as putting the CD in a drive and ensuring that you can start installing the software.

### Acceptance Testing

Smoke testing checks if the software is ready to be tested; in other words, can the software be accepted by the testing team in order to perform some other work on it?  It is a subset of __acceptance testing__.  Acceptance testing is any kind of testing that checks that the system is acceptable to continue to the next phase of its lifecycle, be it testing, or delivery to a customer, or making it ready for a user.  

Depending on the domain, acceptance tests may be scripted or unscripted.  For large contracting companies or complex projects, there are often several test plans verifying that multiple parts of the system operate correctly, and metrics for quality (e.g., no more than three major defects will be found during the test period) which must be met.  For smaller programs, it may be as simple as allowing the customer or user to sit down with the software for a few minutes and getting a thumbs-up or thumbs-down.

Since software developers are usually also not domain experts in the field of the software they are writing, there are many opportunities for a system to be developed which does not meet the needs of the customer.  Even if the requirements are spelled out clearly, there are often ambiguities and assumptions specific to the domain.  For example, to a software developer, a 0-based index makes perfect sense - many popular programming languages enumerate arrays starting with 0, and few Java developers would write a for loop as `for (int j=1; j <= 10; j++) { ... }`  However, for many non-programmers, having `1` reference the second element of a list is very confusing!

Formal acceptance tests are usually determined ahead of time and agreed upon by both the developer of the software and the customer.  If all the tests pass - or the two parties come to some other solution - then the software is said to be accepted by the customer.  Other possible solutions may be a partial payment, payment to be paid after certain defects are fixed, or an understanding that there is a certain level of quality that does not involve all tests passing (e.g., all major tests pass, and at least 95% of minor tests).

__Operational testing__ is testing the system under real-life (operating) conditions.  Oftentimes, a problem is not found, or even thought of, during the development process or when checked piece-by-piece.  Operational testing can find these overlooked errors by actually running the system in a real-life environment.  For example, every piece of a new avionics system may be tested using the techniques described in this book, but the system won't have undergone operational testing until the airplane that the software is running on is actually up in the air.  Often, operational testing is the last kind of testing to occur on a system, ensuring that the system will in fact operate correctly under real-world conditions.  This can be an expensive method of testing, both from a setup standpoint and a risk standpoint.  For example, if the avionics system fails and the plane does not fly correctly, the costs of failure are extremely high; even if it works correctly, using a plane for several hours is probably going to be orders of magnitude more expensive than buying time on a computer for simulations and integration tests.

Another kind of acceptance testing is __user acceptance testing__.  Commonly used in Agile environments, user acceptance testing (UAT) checks that the system meets the goals of the users and operates in a manner acceptable to them.  Usually, a subject matter expert (SME - a non-developer with understanding of the domain the software is written for) is given a number of tasks to perform.  The SME is given no instructions as to how to do the tasks by the person doing the testing; it is up to the person to use the software (along with related documentation, or other supporting material) to figure out how to complete the tasks.  If testing a new web browser, for instance, a user acceptance test may pick a skilled web surfer (if that term is even used anymore - I am pretty sure it is not - but I will leave it in as a reminder of the days of yore) as a SME.  The SME may have three tasks - navigate to a popular search engine's homepage, bookmark a page, and return to a bookmarked page.  Members of the team may watch the SME perform these tasks, but are not to explain or help in any way.  Restraining members of the team from helping can be a difficult task, as those who develop the software have a high level of knowledge about the system and want to show users "the best way" to do things.  However, allowing the SME to attempt the tasks without any help will allow you to see what parts are difficult not just for that person to understand, but other users in that domain who will need to use the software without the benefit of the development team standing behind them.

One can think of __alpha testing__ and __beta testing__ as kinds of acceptance tests.  Although the terms can have slightly different meanings in different domains, they both involve having independent users or teams using the software under development.  In all cases, alpha testing precedes beta testing, if any alpha testing is done.  Alpha testing usually involves a very small, select group of customers - often those of high value or with high technical skill - using the software.  In some cases, it may actually not be a customer doing the testing, but a testing group external to the group that developed the system.  Beta testing involves a broader release of the software to a variety of customers.  This often occurs after some alpha testing for large, well-tested software projects.  However, there is nothing to stop a team from skipping alpha testing entirely and sending software straight out to a large group of people - perhaps the entire customer base - with the understanding that the software is a beta version.  If you are less concerned with having more defects being known to the outside world, fast beta testing can be a way to get quite a bit of usage data and defect reports from the sheer number of people who could be using the system.

With online systems, oftentimes beta testing can be "mixed in" with regular usage of the system.  You can have a specific subset of users - say, those who have shown an interest in trying new features, or customers important for revenue, or even a random sampling - have access to the new functionality you wish to beta test.  Usually, you want to either clear it with these customers or make sure that they know that the functionality they are using is not considered complete.  You can then 

A related concept to acceptance testing is __dogfooding__ or __eating your own dogfood__.  Despite the somewhat disturbing name, this means that the team that is developing the software is also using the software.  This is useful in situations where the system under development is something either common to computer users (e.g., an operating system or text editor) or programmers in particular (an IDE or compiler).  It is usually not possible until later stages of the project, when enough functionality has been completed so as to allow a relatively smooth user experience - it wouldn't make sense to dogfood a program whose main functionality hasn't even been developed yet.  Dogfooding allows extremely fast discovery of defects, since the entire team is using the software, not just the testers.  Even if other members of the team are not specifically looking for defects in a system, the fact that there are a large number of people using it - and using it in similar ways as other users would - means that more defects are likely to be found.  They will also tend to be especially clustered in areas that users are using, allowing for additional metrics to be gathered (both for usage and defect density in different subsystems).  As an added bonus, developers who are using the software that they are writing about have additional incentives to ensure quality in their codebase!
