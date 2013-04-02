class FoodsController < ApplicationController

  def create
    @food = Food.new(params[:food])
    if @food.save
      flash[:success] = "Item added."
      redirect_to :root
    else
      flash[:error] =  @food.errors.full_messages.join(".\n") + "."
      redirect_to :root
    end
  end

end
