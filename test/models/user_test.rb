require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user=User.new(name:"Example User",email:"user@example.com",password:"foobarAAAA",password_confirmation:"foobarAAAA",mobile:"0433838639")
  end

  test "should be valid" do
    assert @user.valid?
  end

end
