require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user = User.create(name: 'Angel', email: 'test@test.com', password: '123456')
    @food = Food.create(user: @user, name: 'pizza', price: 50, measurement_unit: 'kg')
    @recipe = Recipe.create(user: @user, name: 'meet', preparation_time: 120, cooking_time: 20,
                            description: 'Best meet ever', public: true)
    @recipe_food = @recipe.recipe_foods.create(quantity: 5, recipe_id: @recipe.id, food_id: @food.id)
  end

  it 'is only valid with a recipe_id and user_id' do
    expect(@recipe_food).to be_valid
  end

  it 'it is not valid without food id' do
    @recipe_food.food_id = nil
    expect(@recipe_food).not_to be_valid
  end

  it 'it is not valid without recipe id' do
    @recipe_food.recipe_id = nil
    expect(@recipe_food).not_to be_valid
  end

  it 'it is valid with a quantity of 1 or greater than that' do
    @recipe_food.quantity = 1
    expect(@recipe_food).to be_valid
  end
end
