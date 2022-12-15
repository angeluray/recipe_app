require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns a 200 OK status' do
      get new_user_registration_path
      expect(response.status).to eq(200)
    end

    # it 'checks if the correct themplate was rendered' do
    #   get users_path
    #   expect(response).to render_template(:index)
    # end

    it 'checks if the response body includes correct placeholder text' do
      get 'http://localhost:3000/users/sign_up'
      expect(response.body).to include('Name')
    end
  end
end
