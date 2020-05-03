class PostsController < ApplicationController
  include PostsHelper

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

  private
   def post_params 
    params.require(:post).
      permit(:title,:topic_id,:content)
   end
end
