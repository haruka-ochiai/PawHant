require "test_helper"

class Public::CustomersPetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_customers_pets_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_customers_pets_edit_url
    assert_response :success
  end
end
