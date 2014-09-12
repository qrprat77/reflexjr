# the Error class!
module ReflexJr 
	class Error
		attr_reader :type, :first_term, :second_term, :state
		
		def initialize(prob_type, fir_term, sec_term)
			@type = prob_type
			@first_term = fir_term
			@second_term = sec_term
			@state = "Incorrect"
			
		end
	end
end
