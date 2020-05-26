<!DOCTYPE html>
<html>
<body>
<pre>SET search_path to quizschema;

DROP VIEW IF EXISTS StudentAnswers CASCADE;

CREATE VIEW StudentAnswers AS
	SELECT studentid, questionid, answer
	FROM Answer 
	WHERE quizid = &#39;Pr1-220310&#39;;

CREATE VIEW QuestionAnswers AS 
	SELECT t1.id, t1.answer
	FROM Question t1 JOIN QuizQuestions t2
	ON t1.id = t2.questionid
	WHERE t2.quizid = &#39;Pr1-220310&#39;;

CREATE VIEW CompareAnswers AS 
	SELECT t1.studentid, t1.answer as studentAnswer, t2.answer as questionAnswer, t1.questionid 
	FROM StudentAnswers t1, QuestionAnswers t2
	WHERE t1.questionid = t2.id;

CREATE VIEW CorrectAnswers AS
	SELECT studentid, questionid
	FROM CompareAnswers
	WHERE studentAnswer = questionAnswer;

CREATE VIEW IncorrectAnswers AS 
	SELECT studentid, questionid
	FROM CompareAnswers
	WHERE studentAnswer != questionAnswer;

CREATE VIEW CorrectCount AS 
	SELECT questionid, COUNT(*) AS correct 
	FROM CorrectAnswers
	GROUP BY questionid;

CREATE VIEW IncorrectCount AS
	SELECT questionid, COUNT(*) AS incorrect 
	FROM IncorrectAnswers
	GROUP BY questionid;

CREATE VIEW UnansweredCount AS
	SELECT questionid, COUNT(*) AS unanswered
	FROM Unanswered 
	GROUP BY questionid;

CREATE VIEW CollectedResults AS 
	SELECT t1.questionid, correct, incorrect, unanswered
	FROM CorrectCount t1 JOIN IncorrectCount t2
	ON t1.questionid = t2.questionid
	JOIN UnansweredCount t3
	ON t2.questionid = t3.questionid;

SELECT * FROM CollectedResults;
</pre>
</body>
</html>
