require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user= users(:Barry)
    @post = @user.posts.create(title:"Example post", content:"This is an example content",topic_id:1)  
  end

  test "should be valid" do  
    assert @post.valid?
  end

  test "should not accept invalid post" do
    @post = @user.posts.create(title:"", content:"",topic_id:1) 
    assert_not @post.valid? 
  end
end
