require 'spec_helper'

#Spec for Katie's math quiz program.
#Handling the problems.

module ReflexJr
	describe "Problem" do
		prob = ReflexJr::Problem.new("*", 1, 1)
		
		it "has a method called solve that always provides the correct answer" do
			expect(prob.solve).to eq 1
		end
		
		it "has a method called answer that accepts input and returns 'Correct' or 'Incorrect'" do
			expect(prob.answer(1)).to eq 'Correct'
			expect(prob.answer(200)).to eq 'Incorrect'
		end
		
		it "has a method called 'solve' that solves the problem" do
			expect(prob.solve).to eq 1			
		end
		
	end # describe problem

end # Mod ReflexJr
