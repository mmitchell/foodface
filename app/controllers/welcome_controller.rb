class WelcomeController < ApplicationController
  def index
    @foods = Food.today
  end
end
