require 'rails_fancies/fancy_faq_helper'
require 'rails_fancies/fancy_weekly_calendar_helper'
module RailFancies
  class Railtie < Rails::Railtie
    initializer "rails_fancies" do
      ActiveSupport.on_load( :action_view ){ include RailsFancies::FancyFaqHelper }
      ActiveSupport.on_load( :action_view ){ include RailsFancies::FancyWeeklyCalendarHelper }
    end
  end
end