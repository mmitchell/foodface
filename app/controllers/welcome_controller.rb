class WelcomeController < ApplicationController
  def index
    @new_food = Food.new
    @foods = Food.today.order("created_at desc")
  end
end
