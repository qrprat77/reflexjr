require 'spec_helper'
#Spec for Katie's math quiz program.
#times table!
module ReflexJr 
	

	describe "Quiz" do
		quiz = ReflexJr::Quiz.new()
		it "Should populate a new quiz with a default of 10 problems" do
			quiz.quiz_probs.count.should == 10
		end
		
		it "Should have a default quiz type of 'times'" do
			quiz.quiz_type.should == :times
		end
		
		it "Should populate a new quiz with any number of chosen problems" do
			quiz = ReflexJr::Quiz.new(5)
			quiz.quiz_probs.count.should == 5
		end
		
		it "Should have a math problem in each math_probs spot" do
			quiz.quiz_probs.each do |problem|
				problem.class.should == ReflexJr::Problem
			end
		end
		
		it "Should have an action type of times in each problem" do
			quiz.quiz_probs.each do |problem|
				problem.type.should == :times
			end
		end
		
	end #describe Quiz


end #module ReflexJr

