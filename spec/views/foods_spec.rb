require 'rails_helper'

RSpec.describe 'Rendering foods page', type: :feature do
  describe 'Testing signup page' do
    before :each do
      visit user_session_path
      @user = User.new(name: 'Andres', email: 'a@mail.com', password: '123456')
      @user.save!
      visit foods_path
      @food_list = Food.create(name: 'Potato', measurement_unit: 'kg', price: 30)
    end

    feature 'Testing food index page' do
      background { visit foods_path }

      scenario 'It should display Ruby' do
        expect(page).to have_content('Ruby')
      end
      scenario 'It should display Public Recipes' do
        expect(page).to have_content('Public')
      end
    end
  end
end
