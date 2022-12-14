require 'test_helper'

class ShoppingListsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get shopping_lists_index_url
    assert_response :success
  end
end
