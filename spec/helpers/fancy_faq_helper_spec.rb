require 'spec_helper'
module RailsFancies
	describe FancyFaqHelper do

		it 'should reject an answer without a question' do
			r = helper.fancy_faq do |f|
				f.answer :no_question, 'Cannot answer without knowing question'
			end
			expect(r).to include 'FAQ ERROR1'
		end
		
	end
end