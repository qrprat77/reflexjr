Given(/^I am taking a "(.*?)" quiz$/) do |quiztype|
  Qquiz = ReflexJr::Quiz.new() #Start a new ReflexJR Quiz

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

When(/^my answers are "(.*?)"$/) do |state|
  if state == "all_correct"
		pending # generate a new quiz, answer with all correct answers
	end
end

Then(/^my score is "(.*?)"$/) do |scr|
   @quiz.score.should == scr # score expressed as whole number
end

Then(/^each wrong "(.*?)" is added to my file$/) do |equation|
	@quiz.problems.each do |wrong_ans|
		
	end# equation to represent a missed problem. Gets put into a file.
end

