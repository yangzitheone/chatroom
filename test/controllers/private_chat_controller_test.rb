require 'test_helper'

class PrivateChatControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get private_chat_show_url
    assert_response :success
  end

end
