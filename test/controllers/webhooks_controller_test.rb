require 'test_helper'

class WebhooksControllerTest < ActionDispatch::IntegrationTest
  test "should get webhook" do
    get webhooks_webhook_url
    assert_response :success
  end

end
