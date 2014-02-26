module ReflexJr
class Problem 
	attr_accessor :first_term, :second_term, :type
		def initialize(prob_type) 
			@type = prob_type
		end #initialize
		def solve
			if @type == :times
				return @first_term * @second_term.
			else
				return "I don't know how to #{@type} yet please try again"
			end
		end
			
	end # class Problem

end
