module ReflexJr
class Quiz 
	attr_accessor :quiz_probs, :quiz_type
		def initialize(q_size=10, q_type=:times)
		@quiz_probs = [] 
		@quiz_type = q_type
			q_size.times do
				@quiz_probs.push(ReflexJr::Problem.new(@quiz_type, rand(10)+1, rand(10+1)))
			end
		end #initialize
		
		
	end #class Quiz
end #module Timestable
	
