require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.new(name: 'Angel', email: 'test@test.com', password: '123456')
    @user.save
    @food = Food.create(user: @user, name: 'pizza', quantity: 1, price: 50, measurement_unit: 'kg')
    @recipe = Recipe.create(user: @user, name: 'meet', preparation_time: 120, cooking_time: 20,
                            description: 'Best meet ever', public: true)
  end

  it 'is created succesfully' do
    expect(@recipe).to be_valid
  end

  it 'Name is required' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid
  end

  it 'doesnt create the recipe without a user id/user' do
    @recipe.user = nil
    expect(@recipe).to_not be_valid
  end
end
