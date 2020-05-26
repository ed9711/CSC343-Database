<!DOCTYPE html>
<html>
<body>
<pre>

INSERT INTO Student VALUES 
	(&#39;0998801234&#39;, &#39;Lena&#39;, &#39;Headey&#39;),
	(&#39;0010784522&#39;, &#39;Peter&#39;, &#39;Dinklage&#39;),
	(&#39;0997733991&#39;, &#39;Emilia&#39;, &#39;Clarke&#39;),
	(&#39;5555555555&#39;, &#39;Kit&#39;, &#39;Harrington&#39;),
	(&#39;1111111111&#39;, &#39;Sophie&#39;, &#39;Turner&#39;),
	(&#39;2222222222&#39;, &#39;Maisie&#39;, &#39;Williams&#39;);

INSERT INTO Class VALUES
	(120, &#39;Mr Higgins&#39;),
	(366, &#39;Miss Nyers&#39;);
	
INSERT INTO Enrolled VALUES
	(&#39;2222222222&#39;, 366, 5),
	(&#39;0998801234&#39;, 120, 8),
	(&#39;0010784522&#39;, 120, 8),
	(&#39;0997733991&#39;, 120, 8),
	(&#39;5555555555&#39;, 120, 8),
	(&#39;1111111111&#39;, 120, 8);

INSERT INTO Question VALUES
	(782, &#39;MC&#39;, &#39;What do you promise when you take the oath of citizenship?&#39;, 
		&#39;To pledge your loyalty to the Sovereign, Queen Elizabeth II&#39;),
	(566, &#39;TF&#39;, 
		&#39;The Prime Minister, Justin Trudeau, is Canada&#39;&#39;s Head of State.&#39;, 
		&#39;False&#39;),
	(601, &#39;N&#39;, 
		&#39;During the &#39;&#39;Quiet Revolution,&#39;&#39; Quebec experienced rapid change. In what decade did this occur? (Enter the year that began the decade, e.g., 1840.)&#39;, 
		&#39;1960&#39;),
	(625, &#39;MC&#39;, &#39;What is the Underground Railroad?&#39;, 
		&#39;A network used by slaves who escaped the United States into Canada&#39;),
	(790, &#39;MC&#39;, &#39;During the War of 1812 the Americans burned down the Parliament Buildings in York (now Toronto). What did the British and Canadians do in return?&#39;, 
		&#39;They burned down the White House in Washington D.C.&#39;);

INSERT INTO MultipleChoiceOption VALUES
	(0, 782, &#39;To pledge your loyalty to the Sovereign, Queen Elizabeth II&#39;, NULL),
	(1, 782, &#39;To pledge your allegiance to the flag and fulfill the duties of a Canadian&#39;, 
		&#39;Think regally.&#39;),
	(2, 782, &#39;To pledge your loyalty to Canada from sea to sea&#39;, NULL),
	(3, 625, &#39;The first railway to cross Canada&#39;, 
		&#39;The Underground Railroad was generally south to north, not east-west.&#39;),
	(4, 625, &#39;The CPR&#39;&#39;s secret railway line&#39;, 
		&#39;The Underground Railroad was secret, but it had nothing to do with trains.&#39;),
	(5, 625, &#39;The TTC subway system&#39;, 
		&#39;The TTC is relatively recent; the Underground Railroad was in operation over 100 years ago.&#39;),
	(6, 625, &#39;A network used by slaves who escaped the United States into Canada&#39;, NULL),
	(7, 790, &#39;They attacked American merchant ships&#39;, NULL),
	(8, 790, &#39;They expanded their defence system, including Fort York&#39;, NULL),
	(9, 790, &#39;They burned down the White House in Washington D.C.&#39;, NULL),
	(10, 790, &#39;They captured Niagara Falls&#39;, NULL);

INSERT INTO NumericHints VALUES
	(0, 601, &#39;[1800, 1900)&#39;, &#39;The Quiet Revolution happened during the 20th Century.&#39;),
	(1, 601, &#39;[2000, 2010)&#39;, &#39;The Quiet Revolution happened some time ago.&#39;),
	(2, 601, &#39;[2020, 3000)&#39;, &#39;The Quiet Revolution has already happened!&#39;);

INSERT INTO Quiz VALUES
	(&#39;Pr1-220310&#39;, &#39;citizenship Test Practise Questions&#39;, &#39;2017-10-01 13:30:00&#39;, 120, TRUE);

INSERT INTO QuizQuestions VALUES
	(&#39;Pr1-220310&#39;, 601, 2),
	(&#39;Pr1-220310&#39;, 566, 1),
	(&#39;Pr1-220310&#39;, 790, 3),
	(&#39;Pr1-220310&#39;, 625, 2);

INSERT INTO Answer VALUES
	(0, &#39;Pr1-220310&#39;, 601, &#39;0998801234&#39;, &#39;1950&#39;),
	(1, &#39;Pr1-220310&#39;, 566, &#39;0998801234&#39;, &#39;False&#39;),
	(2, &#39;Pr1-220310&#39;, 790, &#39;0998801234&#39;, &#39;They expanded their defence system, including Fort York&#39;),
	(3, &#39;Pr1-220310&#39;, 625, &#39;0998801234&#39;, &#39;A network used by slaves who escaped the United States into Canada&#39;),
	(4, &#39;Pr1-220310&#39;, 601, &#39;0010784522&#39;, &#39;1960&#39;),
	(5, &#39;Pr1-220310&#39;, 566, &#39;0010784522&#39;, &#39;False&#39;),
	(6, &#39;Pr1-220310&#39;, 790, &#39;0010784522&#39;, &#39;They burned down the White House in Washington D.C.&#39;),
	(7, &#39;Pr1-220310&#39;, 625, &#39;0010784522&#39;, &#39;A network used by slaves who escaped the United States into Canada&#39;),
	(8, &#39;Pr1-220310&#39;, 601, &#39;0997733991&#39;, &#39;1960&#39;),
	(9, &#39;Pr1-220310&#39;, 566, &#39;0997733991&#39;, &#39;True&#39;),
	(10, &#39;Pr1-220310&#39;, 790, &#39;0997733991&#39;, &#39;They burned down the White House in Washington D.C.&#39;),
	(11, &#39;Pr1-220310&#39;, 625, &#39;0997733991&#39;, &#39;The CPR&#39;&#39;s secret railway line&#39;),
	(12, &#39;Pr1-220310&#39;, 566, &#39;5555555555&#39;, &#39;False&#39;),
	(13, &#39;Pr1-220310&#39;, 790, &#39;5555555555&#39;, &#39;They captured Niagara Falls&#39;);</pre>
</body>
</html>
