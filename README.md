# database_webapp: Lab 2 in course DD1368 at KTH.
Exercise for course DD1368: Database Technoogy at KTH. Written by Erik Lindström.

## Exercise description: Recitation Results Reporter
Your task is to create a reporting tool for KTH recitations. Create an E/R model that matches the requirements below, convert it to a physical database, populate it with the data required to run a demonstration and create the UI to access and work with the reporter. If you wonder about how something should work, think of the recitations on this course and implement your solution so that it would work here.

### Requirements
- Every course has a number of recitations (rec #1, rec #2, rec #3 a.s.o.)
- Every recitation instance belongs to a specific group -- A,B,C or D, respectively.
- Every recitation has a set of problems, and points are awarded for solving them in given combinations that are specified for every recitation (eg. for the first recitation, the problems available are 1abc, 2abc and 3-1ab2abc, but you can choose any two in the first two sets and any three in the last one). Your database needs to be able to store these conditions for every recitation.
- Students choose one specific group for each recitation and submit checks for the problems they have solutions for.
- Recitation leaders mark the students who have been called to show their solutions.
- When this process is complete, results for a recitation are computed and stored. Note that all results submitted should be recorded, not only those that have been checked by recitation leaders.
GUI to provide
- A student interface where the student chooses between available groups and recitations. Once chosen, the student should be provided with the correct options for that particular recitation to submit checks for done solutions.

## Disclaimer
Do not use this code for cheating or attempts to decieve in examinations.
