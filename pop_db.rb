require './models.rb'

# Purge database
DataMapper.auto_migrate!

# Set up two example courses
Course.create(id: "DD1368", name: "Database technology")
Course.create(id: "ME1003", name: "Industrial Economy")

# Set up the four required groups for each course
Group.create(letter: "A", course_id: "DD1368")
Group.create(letter: "B", course_id: "DD1368")
Group.create(letter: "C", course_id: "DD1368")
Group.create(letter: "D", course_id: "DD1368")
Group.create(letter: "A", course_id: "ME1003")
Group.create(letter: "B", course_id: "ME1003")
Group.create(letter: "C", course_id: "ME1003")
Group.create(letter: "D", course_id: "ME1003")

# Set up tasks for Recitation 1 in DD1368
Taskset.create

Task.create(number: 1, instruction: "answer at least 2 of the following queries in relational algebra", taskset_id: 1)
Taskpart.create(letter: "a", content: "Names of all the students", task_id: 1)
Taskpart.create(letter: "b", content: "Name of the teacher teaching the course with id DD1368", task_id: 1)
Taskpart.create(letter: "c", content: "Names of the students taking the course with id DD1368", task_id: 1)

Task.create(number: 2, instruction: "Answer at least 2 of the following in relational algebra", taskset_id: 1)
Taskpart.create(letter: "a", content: "Names of students that have never scored an E in any course", task_id: 2)
Taskpart.create(letter: "b", content: "Names of teachers who teach more than 1 course", task_id: 2)
Taskpart.create(letter: "c", content: "Highest grade achieved in DD2471 (Note that '>' can compare grades (e.g. A > D) and that it is possible that no one got an A in the course.) ", task_id: 2)

Task.create(number: 3, instruction: "answer at least 3 of these in tuple calculus", taskset_id: 1)
Taskpart.create(letter: "a", content: "1a", task_id: 3)
Taskpart.create(letter: "b", content: "1b", task_id: 3)
Taskpart.create(letter: "c", content: "2a", task_id: 3)
Taskpart.create(letter: "d", content: "2b", task_id: 3)
Taskpart.create(letter: "e", content: "2c", task_id: 3)

# Set up tasks for Recitation 2 in DD1368
Taskset.create

Task.create(number: 1, instruction: "Answer all of the following in relational algebra", taskset_id: 2)
Taskpart.create(letter: "a", content: "Ids of students who have taken every course (you may use division operator)", task_id: 4)
Taskpart.create(letter: "b", content: "Names of teachers who teach exactly 2 courses", task_id: 4)
Taskpart.create(letter: "c", content: "Names of students who have taken every course given by teacher with name \"M. Minock\" (you may use division operator)", task_id: 4)

Task.create(number: 2, instruction: "Answer all of the following in tuple calculus", taskset_id: 2)
Taskpart.create(letter: "a", content: "1a", task_id: 5)
Taskpart.create(letter: "b", content: "1b", task_id: 5)
Taskpart.create(letter: "c", content: "1c", task_id: 5)

Task.create(number: 3, instruction: "Answer all of the following in relational algebra without using the division operator", taskset_id: 2)
Taskpart.create(letter: "a", content: "1a", task_id: 6)

# Setting up example recitations
Recitation.create(name: "Recitation 1", instruction: "<instruction placeholder>", course_id: "DD1368", taskset_id: 1, group_id: 1)
Recitation.create(name: "Recitation 1", instruction: "<instruction placeholder>", course_id: "DD1368", taskset_id: 1, group_id: 2)
Recitation.create(name: "Recitation 1", instruction: "<instruction placeholder>", course_id: "DD1368", taskset_id: 1, group_id: 3)
Recitation.create(name: "Recitation 1", instruction: "<instruction placeholder>", course_id: "DD1368", taskset_id: 1, group_id: 4)

Recitation.create(name: "Recitation 2", instruction: "<instruction placeholder>", course_id: "DD1368", taskset_id: 2, group_id: 1)
Recitation.create(name: "Recitation 2", instruction: "<instruction placeholder>", course_id: "DD1368", taskset_id: 2, group_id: 2)
Recitation.create(name: "Recitation 2", instruction: "<instruction placeholder>", course_id: "DD1368", taskset_id: 2, group_id: 3)
Recitation.create(name: "Recitation 2", instruction: "<instruction placeholder>", course_id: "DD1368", taskset_id: 2, group_id: 4)

# Setting up a test claim to showcase and test with
Claim.create(student_id: "erlindst", student_name: "Erik Lindström",recitation_id: 3)
Claimpart.create(taskpart_id: 1, claim_id: 1)
Claimpart.create(taskpart_id: 2, claim_id: 1)
Claimpart.create(taskpart_id: 4, claim_id: 1)
Claimpart.create(taskpart_id: 5, claim_id: 1)
Claimpart.create(taskpart_id: 7, claim_id: 1)
Claimpart.create(taskpart_id: 8, claim_id: 1)
Claimpart.create(taskpart_id: 9, claim_id: 1)

Claim.create(student_id: "erlindst", student_name: "Erik Lindström", recitation_id: 8)
Claimpart.create(taskpart_id: 12, claim_id: 2)
Claimpart.create(taskpart_id: 13, claim_id: 2)
Claimpart.create(taskpart_id: 14, claim_id: 2)
Claimpart.create(taskpart_id: 15, claim_id: 2)
Claimpart.create(taskpart_id: 16, claim_id: 2)
Claimpart.create(taskpart_id: 17, claim_id: 2)
Claimpart.create(taskpart_id: 18, claim_id: 2)