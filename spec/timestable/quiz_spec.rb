require 'spec_helper'
#Spec for Katie's math quiz program.
#times table!
module ReflexJr 
	

	describe "Quiz" do
		quiz = ReflexJr::Quiz.new()
		it "Should populate a new quiz with a default of 10 problems" do
			expect(quiz.quiz_probs.count).to eq 10
		end
		
		it "Should have a default quiz type of '*'" do
			expect(quiz.quiz_type).to eq "*"
		end
		
		it "Should populate a new quiz with any number of chosen problems" do
			quiz = ReflexJr::Quiz.new(5)
			expect(quiz.quiz_probs.count).to eq 5
		end
		
		it "Should have a math problem in each math_probs spot" do
			quiz.quiz_probs.each do |problem|
				expect(problem).to be_instance_of(ReflexJr::Problem)
			end
		end
		
		it "Should have a string representation of the operator" do
			quiz.quiz_probs.each do |problem|
				expect(problem.type).to eq "*"
			end
		end
		
		it "has a method called :error_list that returns an array" do
			expect(quiz.error_list).to be_instance_of(Array)
		end
		
	end #describe Quiz


end #module ReflexJr

