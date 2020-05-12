require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path,params: {user: {name:" ",
                                      email:"user@invalid",
                                      password:"foo",
                                      password_confirmation:"bar" } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
    end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count',0 do
      post users_path,params: { user: 
                                {name:"Example user",
                                email:"user@example.com",
                                password:"password",
                                password_confirmation:"password" } }
    end
    assert_template root_path
  end

end
