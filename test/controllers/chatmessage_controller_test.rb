require 'test_helper'

class ChatmessageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chatmessage_index_url
    assert_response :success
  end

  test "should get show" do
    get chatmessage_show_url
    assert_response :success
  end

  test "should get update" do
    get chatmessage_update_url
    assert_response :success
  end

  test "should get distroy" do
    get chatmessage_distroy_url
    assert_response :success
  end

end
