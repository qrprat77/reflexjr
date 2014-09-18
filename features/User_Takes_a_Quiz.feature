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
		When I answer the problem "<first_num>" "<type>" "<second_num>" with "<answer>"
		Then the feedback is "<response>"
		
		Scenarios: Katie answers correctly
		|    type   | first_num | second_num | answer | response |
		|    times  |     6     |      8     |    48  | correct  |
		|    add    |     2     |      4     |    6   | correct  |
		| subtracts |     8     |			 5     |    3   | correct  |
		
		Scenarios: Katie answers incorrectly
		|  type  | first_num | second_num | answer | response |
		|  times |     6     |      8     |    84  | incorrect|
		 
	Scenario Outline: Katie takes the quiz
		Given I am taking a "<type>" quiz
		When my answers are "<state>"
		Then my score is "<score>" 
		
		
		Scenarios: Katie answers all questions correctly
		|  type  |    state    | score |
		|  times | all_correct |  100  |
		
		Scenarios: Katie answers some questions incorrectly
		|  type  |  state    | score  |
		|  times | 5_correct |  50    |
		
	Scenario: Katie's incorrect answers are each returned as an error object.
	
		Given some questions in a quiz are wrong
		When I ask the quiz for all the errors
		Then I receive the errors as error objects
