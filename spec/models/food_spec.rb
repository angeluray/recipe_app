require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.create(name: 'Angel', email: 'test@test.com', password: '123456')
    @food = Food.create(user: @user, name: 'pizza', price: 50, measurement_unit: 'kg')
  end

  it 'is created succesfully' do
    expect(@food).to be_valid
  end

  it 'is not created succesfully without a user' do
    @food.user = nil
    expect(@food).not_to be_valid
  end

  it 'is not created succesfully without a name' do
    @food.name = nil
    expect(@food).not_to be_valid
  end

  it 'is not created succesfully without a price' do
    @food.price = nil
    expect(@food).not_to be_valid
  end

  it 'is not created succesfully without a price' do
    @food.measurement_unit = ''
    expect(@food).not_to be_valid
  end

  it 'is not possible to add a repeated ingredient/food name' do
    @food1 = Food.create(user: @user, name: 'pizza', price: 50, measurement_unit: 'kg')
    expect(@food1).not_to be_valid
  end
end
