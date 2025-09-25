require 'rails_helper'
module RailsFancies
	describe FancyFaqHelper do
		it 'should reject an answer without a question' do
			expect{helper.fancy_faq{|f| f.answer :no_question, 'missing question'}}.to raise_error 'No question was found with a name of :no_question'
		end
		it 'should reject two questions with the name name' do
		  expect{
			  helper.fancy_faq do |f|
				f.question :double, 'What cant I have two questions with same name'
				f.question :double, 'Already asked this'
			end
			}.to raise_error 'A question with the name of :double already exists.'
		end
			it 'should output question with no answer' do
				expect(helper.fancy_faq { |f| f.question :no_answer, 'Unanswerable' }).to include(
					'<div class="faq_question"><a href="#no_answer">Unanswerable</a></div>'
				)
			end
			it 'should output question with answer' do
				r = helper.fancy_faq do |f|
					f.question :meaning_of_life, 'What is the meaning of life'
					f.answer :meaning_of_life, '42'
				end
				expect(r).to include(
					'<div class="faq_answer"><a name="meaning_of_life"></a><div class="faq_answer_heading">What is the meaning of life</div><p class="faq_answers">42</p></div>'
				)
			end
	end
end
