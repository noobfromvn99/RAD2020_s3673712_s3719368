require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:Barry)
  end

  test "unsignup user shluld not able to post" do
    get newpost_path
    assert_response :redirect #should get redirect to signup
  end

  test "signup user should be able to post" do
    get login_path
    post login_path, params: {session: {email:  @user.email,
                                        password:'password'} }
    assert_template root_path
    get newpost_path
    assert_response :found
  end
end
