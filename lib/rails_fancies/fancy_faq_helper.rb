module RailsFancies
  module FancyFaqHelper
    def fancy_faq(&block)
      renderer = FancyFaqHelper::FancyFaq.new(self, {})
      capture(renderer, &block)
    end

    class FancyFaq < Struct.new(:view, :question_list)
      delegate :content_tag, to: :view
      def question(name, text)
        question_list[name] = text
        content_tag :a, href: "##{name}", class: 'faq_question' do
          "#{text}?"
        end
      end

      def answer(name, text)
        if question_list[name.to_sym].present?
          content_tag :div, class: 'faq_single_answer' do
            content_tag(:a, '', name: "#{name}") +
              content_tag(:h3, question_list[name.to_sym]) +
              content_tag(:p, "#{text}", class: 'faq_answers')
          end
        else
          content_tag :div, class: 'faq_errors' do
            "FAQ ERROR: No question was found with a name of :#{name}"
          end
        end
      end
    end
  end
end