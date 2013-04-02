class WeightsController < ApplicationController

  def create
    @weight = Weight.new(params[:weight])
    if @weight.save
      flash[:success] = "Weight added."
      redirect_to :root
    else
      flash[:error] =  @weight.errors.full_messages.join(".\n") + "."
      redirect_to :root
    end
  end

end
