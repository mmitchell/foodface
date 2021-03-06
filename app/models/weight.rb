class Weight < ActiveRecord::Base
  attr_accessible :weight
  validates :weight, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 } 
end
