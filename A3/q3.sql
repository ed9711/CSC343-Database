<!DOCTYPE html>
<html>
<body>
<pre>SET search_path TO quizschema;

DROP VIEW IF EXISTS AnswerWeights CASCADE;

CREATE VIEW AnswerWeights AS
	SELECT t1.weight, t2.quizid, t2.questionid, t2.studentid, t2.answer 
	FROM QuizQuestions t1, Answer t2
	WHERE t1.quizid = t2.quizid
	AND t1.quizid = &#39;Pr1-220310&#39;
	AND t1.questionID = t2.questionid;

CREATE VIEW RightAnswer AS 
	SELECT t1.*
	FROM AnswerWeights t1, Question t2
	WHERE t1.questionid = t2.id
	AND t1.answer = t2.answer;

CREATE VIEW TotalWeight AS
	SELECT studentid, SUM(weight)
	FROM RightAnswer
	Group BY studentid;

CREATE VIEW AllStudentWeights AS
	SELECT t1.studentid, COALESCE(t2.sum, 0) AS TotalGrade
	FROM Enrolled t1 LEFT JOIN TotalWeight t2
	ON t1.studentid = t2.studentid
	WHERE t1.class = 120
	AND t1.grade = 8;

CREATE VIEW StudentLastNames AS
	SELECT t1.*, t2.lastName 
	FROM AllStudentWeights t1 JOIN Student t2
	ON t1.studentid = t2.id;

SELECT * FROM StudentLastNames;</pre>
</body>
</html>
