require 'test_helper'

class VerficationTest < ActiveSupport::TestCase
  def setup
    @user = users(:Barry)
    @verification = Verfication.create(fullname:"Barry Huang", cardnum: 3719368 )
    @user.verfication = @verification
  end

  test "should be valid" do  
    puts @verification.user_id
    assert @verification.valid?
  end
end
