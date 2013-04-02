class Weight < ActiveRecord::Base
  attr_accessible :weight
  validates :weight, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }

  def self.past_day_totals(number_of_days = 1)
    a =(1..number_of_days).inject([[nil],[nil]]) do |arr, idx|
      arr[0][idx-1] = Weight.by_day(idx.days.ago).sum(:weight)
      arr[1][idx-1] = Date::DAYNAMES[(Time.now - idx.day).wday][0..2]
      arr
    end
    a = [a[0].reverse, a[1].reverse]
  end  
end
