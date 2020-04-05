require 'test_helper'

class CheckoutFreeControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get checkout_free_show_url
    assert_response :success
  end

end
