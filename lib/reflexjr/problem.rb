module ReflexJr
class Problem 
	attr_accessor :first_term, :second_term, :type, :state
		def initialize(prob_type, fir_term = 1, sec_term = 1) 
			@type = prob_type
			@first_term = fir_term
			@second_term = sec_term
			@state = "Not answered"
		end #initialize
		
		def solve
			if @type == :times
				return @first_term * @second_term
			else
				 #raise an error about not being able to #{@type} 
			end
		end
		
		def answer(input)
			input == self.solve ? @state = "Correct" : @state = "Incorrect"
		end
			
	end # class Problem

end
