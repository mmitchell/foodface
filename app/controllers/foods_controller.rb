class FoodsController < ApplicationController

  def create
    @food = Food.new(params[:food])
    save_or_flash_error @food
    redirect_to :root
  end

end
