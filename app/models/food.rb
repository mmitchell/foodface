class Food < ActiveRecord::Base
  attr_accessible :calories, :name

  def self.past_day_totals(number_of_days = 1)
    (1..number_of_days).inject([]) do |totals, days_ago|
      totals[days_ago-1] = Food.by_day(days_ago.days.ago).sum(:calories)
      totals
    end
  end  
end
