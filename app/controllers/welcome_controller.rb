class WelcomeController < ApplicationController
  def index
    @new_food = Food.new
    @new_weight = Weight.new
    @foods = Food.today.order("created_at desc").all
    @weight = Weight.today.first
    gon.past_calorie_data = past_day_totals(14){ |idx| Food.by_day(idx.days.ago).sum(:calories) }
    gon.past_weight_data = past_day_totals(14){ |idx| Weight.by_day(idx.days.ago).sum(:weight) }
  end

  def show
    @weight = Weight.by_day(params[:day].to_i.days.ago).first
    @foods = Food.by_day(params[:day].to_i.days.ago).order("created_at desc").all
  end
end
