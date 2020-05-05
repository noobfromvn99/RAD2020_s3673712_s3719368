require 'test_helper'

class VerficationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get verfications_new_url
    assert_response :success
  end

end
