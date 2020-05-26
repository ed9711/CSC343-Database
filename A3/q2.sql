<!DOCTYPE html>
<html>
<body>
<pre>SET search_path to quizschema;

DROP VIEW IF EXISTS RelevantQuestionData CASCADE;

-- The relevant sections of the questions table
CREATE VIEW RelevantQuestionData AS
	SELECT id, type, substring(qText FROM 0 FOR 50) AS qText
	FROM Question;

-- Hints associated with multiple choice questions
CREATE VIEW MCHints AS
	SELECT t1.*, t2.hint
	FROM RelevantQuestionData t1, MultipleChoiceOption t2
	WHERE t1.id = t2.questionid
	AND t1.type = &#39;MC&#39;
	AND t2.hint IS NOT NULL;

-- Hints associated with numeric questions
CREATE VIEW NumHints AS
	SELECT t1.*, t2.hint
	FROM RelevantQuestionData t1, NumericHints t2
	WHERE t1.id = t2.questionid
	AND t1.type = &#39;N&#39;
	AND t2.hint IS NOT NULL;

-- All hints
CREATE VIEW AllHints AS
	SELECT *
	FROM MCHints
	UNION
	SELECT *
	FROM NumHints;

-- Total hint count for each question
CREATE VIEW HintCount AS
	SELECT id, type, substring(qText FROM 0 FOR 50) AS qText, COUNT(*)
	FROM AllHints
	GROUP BY id, type, qText;

-- All questions including TF. All TF questions have a NULL value in the count
-- column.
CREATE VIEW AllQuestions AS
	SELECT t1.*, CASE WHEN t1.type = &#39;TF&#39; THEN NULL ELSE t2.count END AS hintCount
	FROM RelevantQuestionData t1 LEFT OUTER JOIN AllHints t2
	ON t1.id = t2.id
	GROUP BY t1.id, t1.type, t1.qText;

SELECT id, qText, hintCount FROM AllQuestions;</pre>
</body>
</html>
