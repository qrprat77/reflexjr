module ReflexJr
class Quiz 
	attr_accessor :quiz_probs, :quiz_type
								
								
	OPERATOR ={times: "*", add: "+", subtract: "-"}
														 
		def initialize(q_size=10, q_type=:times)
			@quiz_probs = [] 
			@score = 0
			if OPERATOR.keys.include?(q_type)
				@quiz_type = OPERATOR[q_type]
			else
				@quiz_type = q_type
			end
				q_size.times do
					@quiz_probs.push(ReflexJr::Problem.new(@quiz_type, rand(10)+1, rand(10)+1))
				end
		end #initialize
		
		def score 
			num_right = 0
			tot_num = @quiz_probs.count
			@quiz_probs.each do|prob|
				prob.state == "Correct" ? num_right += 1 : next
			end
		
			return ((num_right * 100)/tot_num)
		end
		
		def takequiz(input = STDIN, output = STDOUT)
			@input = input
			@output = output
			@output.puts "Answer the questions to see if you know how to #{@quiz_type}!"
			@quiz_probs.each do |prob|
				@output.puts prob.first_term.to_s + " " + prob.type.to_s + " " + prob.second_term.to_s
				ans = @input.gets.chomp.to_i
				prob.answer(ans)
				@output.puts prob.state
			end
		end
		
		def error_list
			errors = [] 
			 @quiz_probs.each do |prob|
					if prob.state == "Incorrect" 
						errors.push(ReflexJr::Error.new(prob.first_term, prob.second_term, prob.type))
					end
				end
				errors
		end
		
		
	end #class Quiz
end #module Timestable
	
