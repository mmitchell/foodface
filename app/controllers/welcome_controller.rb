class WelcomeController < ApplicationController
  def index
    @new_food = Food.new
    @new_weight = Weight.new
    @foods = Food.today.order("created_at desc").all
    gon.past_calorie_data = Food.past_day_totals(14)
  end

  def show
    @foods = Food.by_day(params[:day].to_i.days.ago).order("created_at desc").all
  end
end
