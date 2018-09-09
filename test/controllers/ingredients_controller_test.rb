require 'test_helper'

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get ingredients_name:string_url
    assert_response :success
  end

end
