require 'rails_helper'

RSpec.describe 'Rendering foods page', type: :feature do
  describe 'Testing signup page' do
    before :each do
      visit user_session_path
      @user = User.new(name: 'Andres', email: 'a@mail.com', password: '123456')
      @user.save
      @food_list = Food.create(name: 'Potato', measurement_unit: 'kg', price: 30)
      click_button 'sign in'
    end

    feature 'Testing food index page' do
      background { visit foods_path }

      scenario 'It should display measurement unit' do
        expect(page).to have_content('kg')
      end
      scenario 'It should display Food name' do
        expect(page).to have_content('Potato')
      end

      scenario 'It should display food price' do
        expect(page).to have_content(30)
      end
    end
  end
end
