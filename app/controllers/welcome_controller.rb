class WelcomeController < ApplicationController
  def index
    @new_food = Food.new
    @foods = Food.today.order("created_at desc").all
    @totals = Food.past_day_totals(14)
  end
end
