<!DOCTYPE html>
<html>
<body>
<pre>SET search_path TO quizschema;

DROP VIEW IF EXISTS MrHigginsStudents CASCADE;

CREATE VIEW MrHigginsStudents AS
	SELECT studentid
	FROM Enrolled
	WHERE class = 120
	AND grade = 8;

CREATE VIEW QuizAnswers AS 
	SELECT t1.questionid, t2.studentid, t2.answer 
	FROM QuizQuestions t1, Answer t2
	WHERE t1.quizid = t2.quizid
	AND t1.quizid = &#39;Pr1-220310&#39;
	AND t1.questionid = t2.questionid;

CREATE VIEW MrHigginsAnswers AS
	SELECT t1.*, t2.questionid
	FROM MrHigginsStudents t1 LEFT JOIN QuizAnswers t2
	ON t1.studentid = t2.studentid; 

CREATE VIEW AllPossibleAnswers AS
	SELECT t1.studentid, t2.questionid
	FROM MrHigginsStudents t1, QuizQuestions t2
	WHERE t2.quizid = &#39;Pr1-220310&#39;;

CREATE VIEW Unanswered AS 
	SELECT *
	FROM AllPossibleAnswers
	EXCEPT
	SELECT *
	FROM MrHigginsAnswers;

CREATE VIEW QuestionText AS
	SELECT t1.*, substring(t2.qText FROM 0 FOR 50) AS qText
	FROM Unanswered t1, Question t2
	WHERE t1.questionid = t2.id;

SELECT * FROM QuestionText;</pre>
</body>
</html>
