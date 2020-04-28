require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user= users(:Barry)
    @post = @user.posts.create(title:"Example post", content:"This is an example content")  
  end

  test "should be valid" do  
    assert @post.valid?
  end
end
