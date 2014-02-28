module ReflexJr
class Quiz 
	attr_accessor :quiz_probs, :quiz_type
		def initialize(q_size=10, q_type=:times)
		@quiz_probs = [] 
		@score = 0
		@quiz_type = q_type
			q_size.times do
				@quiz_probs.push(ReflexJr::Problem.new(@quiz_type, rand(10)+1, rand(10)+1))
			end
		end #initialize
		
		def score 
			num_right = 0
			tot_num = @quiz_probs.count
			@quiz_probs.each do|prob|
				if prob.state == "Correct" 
					num_right += 1 
				end
			end
			return ((num_right/tot_num)*100)
		end
		
		def takequiz(input = STDIN, output = STDOUT)
			@input = input
			@output = output
			@output.puts "Answer the questions to see if you know your times tables!"
			@quiz_probs.each do |prob|
				@output.puts prob.first_term.to_s + " " + prob.type.to_s + " " + prob.second_term.to_s
				ans = @input.gets.chomp.to_i
				prob.answer(ans)
				@output.puts prob.state
			end
		end
		
		
	end #class Quiz
end #module Timestable
	
