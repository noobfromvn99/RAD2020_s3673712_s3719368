require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user= users(:Barry)
    @post = posts(:Hello)
    @comment = Comment.new(post_id: @post.id, user_id: @user.id,content: "Example comment")  
  end

  test "comment should be valid" do
    assert @comment.valid?
  end

  test "subcomment should be valid" do
    @comment = comments(:One)
    @subcomment = Comment.create(comment_id: @comment.id,user_id: @user.id, content: "Reply to a reply")
    assert @subcomment.valid?
  end
end
