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
			@first_term.send(@type, @second_term)
		end
		
		def answer(input)
			input == self.solve ? @state = "Correct" : @state = "Incorrect"
		end
			
	end # class Problem

end
