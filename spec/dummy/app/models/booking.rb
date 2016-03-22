class Booking < ActiveRecord::Base
  def name
    "J. Smith #{id % 10}"
  end
end
