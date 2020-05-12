require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:Barry)
  end

  test "signup user should be able to post" do
    get login_path
    post login_path, params: {session: {email:  @user.email,
                                        password:'password'} }
                                        assert_template root_path
  end
end
