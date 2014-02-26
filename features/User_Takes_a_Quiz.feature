Feature: Katie takes a quiz
A quiz has a certain number of questions, and is of a certain type, like
times, add, divide, etc. The default number of questions is 10, and the 
default type is "times". When Katie takes a quiz, each problem is 
presented one at a time. As Katie answers, she is given immediate
feedback if the answer is correct or not. Incorrect answers are marked
in a file for further analysis and practice. At the end of the quiz, 
Katie receives a score and "prize". The prize is a token that Katie can 
collect. 

	Scenario Outline: Katie answers a problem
		Given I am taking a "<type>" quiz
		When I answer "<equation>" with "<answer>"
		Then the feedback is "<response>"
		And the "<equation>" is "<marked_or_not>"
		
		Scenarios: Katie answers correctly
		|  type  | equation | answer | response | marked_or_not |
		| :times |   6 * 8  |   48   | Correct  |       nil     |
		
		Scenarios: Katie answers incorrectly
		|  type  | equation | answer |  response  | marked_or_not |
		| :times |   6 * 8  |   84   | Incorrect  |    marked     |
 
