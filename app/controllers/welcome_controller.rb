class WelcomeController < ApplicationController
  def index
    @new_food = Food.new
    @foods = Food.today
  end
end
