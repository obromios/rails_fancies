require 'spec_helper'
module RailsFancies
	describe FancyFaqHelper do
		it 'should reject an answer without a question' do
			expect{helper.fancy_faq{|f| f.answer :no_question, 'missing question'}}.to raise_error 'No question was found with a name of :no_question'
		end
		it 'should output question with no answer' do
			expect(helper.fancy_faq{|f| f.question :no_answer, 'Unanswerable'}).to include
				'<a href=\"#no_answer\" class=\"faq_question\">Unanswerable?</a>'
		end
		it 'should output question with answer' do
			r = helper.fancy_faq do |f|
				f.question :meaning_of_life, 'What is the meaning of life'
				f.answer :meaning_of_life, '42'
			end
			expect(r).to include
				'<div class=\"faq_single_answer\"><a name=\"meaning_of_life\"></a><h3>What is the meaning of life</h3><p class=\"faq_answers\">42</p></div>'
		end
	end
end