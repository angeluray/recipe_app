class RecipeFoodsController < ApplicationController
  def index
    @foods = Food.all
  end
end
