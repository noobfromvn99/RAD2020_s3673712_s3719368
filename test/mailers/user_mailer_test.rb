require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def setup
    @user = users(:Barry)
  end

  test "password_reset" do
    mail = UserMailer.password_reset(@user)
    assert_equal "Forget password", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["noreply@rmit.com"], mail.from
  end

end
