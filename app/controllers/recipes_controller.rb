class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.includes([:user])
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods.includes([:food])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to @recipe,
                  notice: 'Recipe was added successfully.'

    else
      render :new, alert: 'Failed to add recipe'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'The recipe was successfully destroyed.'
    redirect_to recipes_url
  end

  def public
    @recipes = Recipe.where(public: true)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params
      .require(:recipe)
      .permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
