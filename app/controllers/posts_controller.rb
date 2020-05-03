class PostsController < ApplicationController
  include PostsHelper
  before_action :logged_in?, only:[:create, :destroy]
  before_action :correct_user, only: :destroy
  def new
    if logged_in?
      @user = current_user
      @post = Post.new
    else
      redirect_to root_url
    end
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    if @post.save
      flash[:success] = "Success!"
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    increaseViewed(@post)
    uid = @post.user_id #find author ID
    @topic = getTopic(@post.topic_id)
    @user = User.find(uid)
  end

  def my_posts
    @my_posts = Post.where(user_id: current_user.id)
  end  

  def my_comments
    @my_comments = Comment.where(user_id: current_user.id, comment_id: nil)
    @my_comments_to_comments = Comment.where(user_id: current_user.id, comment_id: !nil)
  end

  def other_comments
    @comments = Comment.joins(:post).where(posts.user_id: current_user.id)
  end
  
  def comment
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to get_post(@comment.post_id)
    else 
      redirect_to get_post(@comment.post_id)
    end
  end

  def reply
    @comment = Comment.find(params[:comment])
    respond_to do |format|
      format.html  
      format.js
    end
  end

  def create_reply
    @comment = Comment.create(reply_params)
    if @comment.save
      redirect_back(fallback_location: posts_path)
    end
  end

  private
   def post_params 
    params.require(:post).
      permit(:title,:topic_id,:content, :picture)
   end

   private
   def comment_params 
    params.require(:comment).
      permit(:user_id,:post_id,:content)
   end

   private
   def reply_params 
    params.require(:comment).
      permit(:user_id,:comment_id,:content)
   end
end
