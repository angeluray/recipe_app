class ShoppingListsController < ApplicationController
  def index
    @food = Food.all
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods
    @shopping_lists = @recipe_foods
    @total = sum(@shopping_lists)
  end

  def create
    @food = Food.all
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods
    @shopping_lists = @recipe_foods
    @total = sum(@shopping_lists)
  end

  def sum(shopping_lists)
    total = 0
    shopping_lists.each do |sp_food|
      total += sp_food.food.price * sp_food.quantity.to_i
    end
    total
  end
end
