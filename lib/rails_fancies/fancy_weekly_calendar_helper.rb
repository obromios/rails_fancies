# basis for this is http://railscasts.com/episodes/213-calendars-revised
module RailsFancies
	module FancyWeeklyCalendarHelper
	  def fancy_weekly_calendar(date = Date.today, &block)
	    Calendar.new(self, date, block).table
	  end
	  def show_details(date, slot_num)
	    if @bookings.where(day: date, slot: slot_num).first
	      booking = @bookings.where(day: date, slot: slot_num).first
	      link_to booking.name, booking
	    elsif Calendar.available?(date, slot_num)
	      link_to 'Book Me', bookings_path(booking:
	        { day: date, slot: slot_num }), method: :post
	    end
	  end
	  class Calendar < Struct.new(:view, :date, :callback)
	    HEADER = %w[Time Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
	    START_DAY = :monday
	    SLOT_DURATION = 30.minutes
	    SLOT_START = 17
	    SLOT_END = 31

	    delegate :content_tag, to: :view

	    def table
	      content_tag :table, class: "calendar" do
	        header + weekly_rows
	      end
	    end

	    def header
	      content_tag :tr do
	        HEADER.map { |day| content_tag :th, day }.join.html_safe
	      end
	    end

	    def weekly_rows
	      slot_num = SLOT_START - 1
	      weekly_slots.map do |week|
	        slot_num += 1
	        content_tag :tr do
	          row = [slot_cell(slot_num)]
	          row += week.map { |day| day_slot_cell(day,slot_num) }
	          row.join.html_safe
	        end
	      end.join.html_safe
	    end

	    def slot_cell(slot_num)
	      content_tag :td do
	        slot_num_to_time(slot_num)
	      end
	    end

	    def slot_num_to_time(slot_num)
	      start_time = slot_start_time + (slot_num - SLOT_START) * SLOT_DURATION
	      Time.at(start_time).utc.strftime("%H:%M")
	    end

	    def slot_start_time
	      SLOT_START * SLOT_DURATION
	    end

	    def day_slot_cell(day, slot_num)
	      content_tag :td, view.capture(day, slot_num, &callback), class: day_classes(day, slot_num)
	    end

	    def day_classes(day, slot_num)
	      classes = []
	      classes << 'today' if day == Date.today
	      classes << 'notmonth' if day.month != date.month
	      classes << 'available' if Calendar.available?(day, slot_num)
	      classes.empty? ? nil : classes.join(' ')
	    end

	    def weekly_slots
	      first = date.beginning_of_week(START_DAY)
	      last = date.end_of_week(START_DAY)
	      weeks = []
	      week = (first..last).to_a
	      slots = (SLOT_START..SLOT_END)
	      slots.each do
	        weeks << week
	      end
	      weeks
	    end

	    def slots
	      (SLOT_START..SLOT_END) 
	    end


	    def self.available?(day, slot_num)
	      day_sym = day.strftime("%A").downcase.to_sym
	      slots = Calendar.availability_hash[day_sym]
	      slot_num.in? slots if slots.present?
	    end

	    def self.availability_hash
	      { monday: [17, 18, 19, 20, 21, 24, 25, 26, 27],
	        tuesday: [17, 18, 19, 20, 21, 24, 25, 26, 27],
	        wednesday: [17, 18, 19, 20, 21],
	        thursday: [17, 18, 19, 20, 21, 24, 25, 26, 27],
	        friday: [17, 18, 19, 20, 21, 24, 25, 26, 27],
	        sunday: [24, 25, 26, 27]
	      }
	    end
	  end
	end
end