require 'test_helper'

class EmojisControllerTest < ActionDispatch::IntegrationTest
  test "should get new,create" do
    get emojis_new,create_url
    assert_response :success
  end

end
