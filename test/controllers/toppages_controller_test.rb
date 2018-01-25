require 'test_helper'

class ToppagesControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get toppages_root_url
    assert_response :success
  end

end
