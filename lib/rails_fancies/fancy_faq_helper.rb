module RailsFancies
  module FancyFaqHelper
    def fancy_faq(&block)
      renderer = FancyFaqHelper::FancyFaq.new(self, {})
      capture(renderer, &block)
    end

    class FancyFaq < Struct.new(:view, :question_list)
      delegate :content_tag, to: :view
      def question(name, text)
        add_to_list question_list, name, text
        content_tag :div, class: 'faq_question' do
          content_tag :a, href: "##{name}" do
            "#{text}?"
          end
        end
      end

      def answer(name, text)
        if question_list[name.to_sym].present?
          content_tag :div, class: 'faq_answer' do
            content_tag(:a, '', name: "#{name}") +
              content_tag(:div, question_list[name.to_sym]+'?', class: 'faq_answer_heading') +
              content_tag(:p, "#{text}", class: 'faq_answers')
          end
        else
          raise "No question was found with a name of :#{name}"
        end
      end

      private

      def add_to_list(list, name, text)
        if list[name].present?
          raise "A question with the name of :#{name} already exists."
        else
          list[name] = text
        end
      end
    end
  end
end