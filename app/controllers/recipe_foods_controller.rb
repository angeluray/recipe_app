class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!, :set_recipe_food, only: %i[show edit update destroy]

  def index
    @foods = Food.includes([:food])
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.create(recipe_foods_params)
    if @recipe_food.save
      flash[:notice] = 'Food created sucessfully.'
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    flash[:success] = 'Recipe Food deleted successfully.'
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  def update
    @recipe = Recipe.find_by(id: params[:recipe_id])

    respond_to do |format|
      if @recipe_food.update(recipe_foods_params)
        format.html do
          redirect_to recipe_path(@recipe), notice: 'Recipe food was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @recipe_food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  def recipe_foods_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
