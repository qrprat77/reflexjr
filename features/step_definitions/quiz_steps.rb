Given(/^I am taking a "(.*?)" quiz$/) do |quiztype|
  @quiz = ReflexJr::Quiz.new() #Start a new ReflexJR Quiz

end

When(/^I answer the problem "(.*?)" "(.*?)" "(.*?)" with "(.*?)"$/) do |fir_num, typ, sec_num, ans|
  @fir_num = fir_num.to_i
  @sec_num = sec_num.to_i
   
  @prob = ReflexJr::Problem.new(typ.to_sym, @fir_num, @sec_num)
  if typ == "times" #this is testing the behavior of the app, refac out to spec?
		@prob.solve.should == (@fir_num * @sec_num)
	#else <other math operand>
	end
end

Then(/^the feedback is "(.*?)"$/) do |response|
  @prob.state.should == "Not answered"
  @prob.answer(response.to_i)
  @prob.solve == response.to_i ? @prob.state.should == "Correct" : @prob.state.should =="Incorrect"  
end

When(/^my answers are "(.*?)"$/) do |st|
  @quiz = ReflexJr::Quiz.new()
  if st == "all_correct"
		@quiz.quiz_probs.each do |prob|
				ans = prob.first_term * prob.second_term
				prob.answer(ans)
		end
	elsif st == "5_correct"  
		@quiz.quiz_probs[0..4].each do |prob|
				ans = prob.first_term * prob.second_term
				prob.answer(ans)
		end	
	#else if st == some other value		
	end #end if
end
Then(/^my score is "(.*?)"$/) do |scr|
   @quiz.score.should == scr.to_i # score expressed as whole number
end

Then(/^each wrong "(.*?)" is added to my file$/) do |equation|
	pending #equation to represent a missed problem. Gets put into a file.
end

