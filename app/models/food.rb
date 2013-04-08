class Food < ActiveRecord::Base
  attr_accessible :calories, :name
  validates :name, :presence => true
  validates :calories, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
end
