class FoodsController < ApplicationController

  def create
    @food = Food.new(params[:food])
    @food.save!
    redirect_to :root
  end

end
