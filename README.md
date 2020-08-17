# AR-Environment-Skeleton

You can use this repo to build new Activerecord projects

* You will need to create your own app/models directories

Domain: Student-Teacher
- A Student has a first_name (string)
- A Student has a last_name (string)
- A Student has a grade_level (string), for ex: “first”, “second”, “third”, etc...
- Student#full_name should return the first and last name of the student in one string, for ex: “Ian Grubb”
- Student#grade_level should return the student’s grade level
- Student.all should return a list of all students
- Student.all_in_grade should receive an argument of a grade, ex: “first”, and return all students who are in that grade
- A Teacher has a last_name (string)
- A Teacher has a grade_level (string)
- A Teacher has a years_of_experience (integer)
- Teacher#tenure should return true if a teacher has taught more than 5 years, otherwise false
You should have a completed seeds file for testing
Answer the following questions in the README:
Which method(s) does Active Record create for you?

#Gradelevel, #all


Which method(s) did you have to create yourself? Why?

#first_and_last_name because they are stored as separate data items.
#all_in_grade because I had provide a specific grade(arg) to filter between different all possible grade levels.
#tenure because I had to specify to only return true if said teacher had worked longer than 5 years.

