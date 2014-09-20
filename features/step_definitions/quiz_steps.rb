
Given(/^I am taking a "(.*?)" quiz$/) do |quiztype|
  @quiz = ReflexJr::Quiz.new() 
  @typ = quiztype #Start a new ReflexJR Quiz

end

When(/^I answer the problem "(.*?)" "(.*?)" "(.*?)" with "(.*?)"$/) do |fir_num, typ, sec_num, ans|
  @fir_num = fir_num.to_i
  @sec_num = sec_num.to_i
	@prob = ReflexJr::Problem.new(typ, @fir_num, @sec_num)
	expect(@prob.solve).to eq(@fir_num.send(typ, @sec_num))
	
end

Then(/^the feedback is "(.*?)"$/) do |response|
  expect(@prob.state).to eq("Not answered")
  @prob.answer(response.to_i)
  if @prob.solve == response.to_i 
		expect(@prob.state).to eq("Correct")
	else 
		expect(@prob.state).to eq("Incorrect")
	end
end

When(/^my answers are "(.*?)"$/) do |st|
  @quiz = ReflexJr::Quiz.new()
  if st == "all_correct"
		@quiz.quiz_probs.each do |prob|
				ans = prob.first_term.send(@typ, prob.second_term)
				prob.answer(ans)
		end
	elsif st == "5_correct"  
		@quiz.quiz_probs[0..4].each do |prob|
				ans = prob.first_term.send(@typ, prob.second_term)
				prob.answer(ans)
		end	
	#else if st == some other value		
	end #end if
end

Then(/^my score is "(.*?)"$/) do |scr|
   expect(@quiz.score).to eq(scr.to_i) # score expressed as whole number
end

Given(/^some questions in a quiz are wrong$/) do
  @bad_quiz = ReflexJr::Quiz.new()
  
  @bad_quiz.quiz_probs[0..4].each do |prob|
		ans = prob.first_term * prob.second_term
		prob.answer(ans)
	end
	@bad_quiz.quiz_probs[5..9].each do |prob|
		ans = (prob.first_term + 1) * (prob.second_term + 1)
		prob.answer(ans)
	end
	
  
end

When(/^I ask the quiz for all the errors$/) do
  @errors = @bad_quiz.error_list
end

Then(/^I receive the errors as error objects$/) do
	expect(@errors).to_not be_empty
  @errors.each do |err|
		expect(err).to be_instance_of(ReflexJr::Error)
	end
end




