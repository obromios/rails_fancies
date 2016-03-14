require 'spec_helper'
module RailsFancies
	describe FancyFaqHelper do
		it	'temp' do
			 expect { raise 'something' }.to raise_error 'something'
		end

		it 'should reject an answer without a question' do
			expect{helper.fancy_faq{|f| f.answer :no_question, 'missing question'}}.to raise_error 'No question was found with a name of :no_question'
		end
		
	end
end