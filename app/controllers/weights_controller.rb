class WeightsController < ApplicationController

  def create
    @weight = Weight.new(params[:weight])
    save_or_flash_error @weight
    redirect_to :root
  end

end
