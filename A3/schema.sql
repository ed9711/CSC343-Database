<!DOCTYPE html>
<html>
<body>
<pre>/*
	1. Constraints that could not have been enforced:
		
	
	2. Constraints that could have been enforced but were not:
		- &quot;Only a student in the class that was assigned a quiz can answer 
		  questions on that quiz.&quot;
*/

DROP SCHEMA IF EXISTS quizschema CASCADe;
CREATE SCHEMA quizschema;
SET search_path TO quizschema;

/*
	The bare necessities to identify a student.
*/

CREATE TABLE Student(
	/*
		10 digit student id stored as a string. This allows for left zero 
		padding to create a valid student ID and allows for a simple check to 
		ensure that the id is 10 characters. This may slow down comparisons
		but allows for a wider range of student ids to be used. This could 
		lead to storage issues in the long term but we will have 
		[0000000000 - 9999999999] rather than the range [1000000000 - 9999999999]
	*/
	id VARCHAR(10) PRIMARY KEY check(LENGTH(id) = 10),
	-- First name of student
	firstName VARCHAR(20),
	-- Last name of student
	lastName VARCHAR(20)
);

/*
	This table keeps track of all the classes in the database.
*/
CREATE TABLE Class(
	-- The id field stores the room number
	id INT PRIMARY KEY,
	-- The teacher for the class room
	teacher VARCHAR(50)
);

/*
	This table keeps track of the classrooms and grades that a student is 
	enrolled in. 
*/
CREATE TABLE Enrolled(
	studentid VARCHAR(10) REFERENCES Student(id),
	class INT REFERENCES Class(id),
	grade INT NOT NULL
);

/*
	All relevant quiz meta-data is stored in this table. Since there could be
	a varying amount of questions on any given quiz, it makes sense to separate
	the questions from this table to avoid having multiple NULL fields to 
	accommodate for larger quizzes.
*/
CREATE TABLE Quiz(
	id VARCHAR(30) PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	due DATE NOT NULL,
	class INT REFERENCES Class(id),
	hintsAllowed boolean DEFAULT FALSE
);

/*
	All questions are kept in the same table, using varchar for the answer 
	field. This allows us to maintain a single table which may take up more 
	space for True/False questions or numeric questions. But, from the given
	data-set, most questions are MC. This also
		-Ensures questionids are unique without referencing other tables.
		-Avoids NULL fields (If using one table but different answer types)
*/
CREATE TABLE Question(
	id INT PRIMARY KEY,
	type VARCHAR(4) NOT NULL,
	-- Question text
	qText VARCHAR(255) NOT NULL,
	-- The answer to the question.
	answer VARCHAR(255) NOT NULL
);

/*
	Links each question with a quiz. This allows a question to be used several
	times across multiple quizzes with varying weights. 
		(e.g There may be similar quizzes for the same class and students in 
		 different grades may have questions weighted differently)
*/
CREATE TABLE QuizQuestions(
	quizid VARCHAR(30) REFERENCES Quiz(id),
	questionid INT REFERENCES Question(id),
	weight INT NOT NULL
);
/*
	Having a table for individual multiple choice options allows for us to have
	a dynamic amount of multiple choice questions without having a large amount
	of NULL fields to accomodate MC questions with more options.
*/
CREATE TABLE MultipleChoiceOption(
	id INT PRIMARY KEY,
	questionid INT REFERENCES Question(id),
	option VARCHAR(255) NOT NULL,
	hint VARCHAR(255)
);
--Unsure about this table
CREATE TABLE NumericHints(
	id INT PRIMARY KEY,
	questionid INT REFERENCES Question(id),
	-- If no range is specified, it defaults to the integer range.
	bounds int4range DEFAULT &#39;[-2147483648, 2147483647)&#39;,
	hint VARCHAR(255) NOT NULL
);
/*
	Stores student answers to quiz questions.
*/
CREATE TABLE Answer(
	id INT PRIMARY KEY,
	quizid VARCHAR(30) REFERENCES Quiz(id),
	questionid INT REFERENCES Question(id),
	studentid VARCHAR(10) REFERENCES Student(id),
	-- Does not store non-answers. Non-answers are omitted from this table.
	answer VARCHAR(255) NOT NULL
);
</pre>
</body>
</html>
