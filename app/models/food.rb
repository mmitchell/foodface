class Food < ActiveRecord::Base
  attr_accessible :calories, :name

  scope :today, lambda { 
    {
      :conditions => ["created_at >= ?", Time.now.beginning_of_day]
    }
  }
  
end
