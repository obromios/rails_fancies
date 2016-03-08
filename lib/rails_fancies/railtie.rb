require 'rails_fancies/fancy_faq_helper'
module RailFancies
  class Railtie < Rails::Railtie
    initializer "rails_fancies.fancy_faq_helper" do
      ActiveSupport.on_load( :action_view ){ include RailsFancies::FancyFaqHelper }
    end
  end
end