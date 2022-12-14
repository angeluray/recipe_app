class ShoppingListsController < ApplicationController
  def index
    @food = Food.all
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.includes([:food])
    @total = sum(@recipe_foods)
  end

  def create
    @food = Food.all
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.includes([:food])
    @total = sum(@recipe_foods)
  end

  def sum(recipe_foods)
    total = 0
    recipe_foods.each do |rf_food|
      total += rf_food.food.price * rf_food.quantity.to_i
    end
    total
  end
end
