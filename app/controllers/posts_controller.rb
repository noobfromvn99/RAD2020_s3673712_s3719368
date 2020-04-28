class PostsController < ApplicationController

  def new
    if current_user == nil
      redirect_to root_url
    else
      @user = current_user
      @post = Post.new
    end
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    if @user.save
      flash[:success] = "Success!"
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    uid = @post.user_id #find author ID

    @user = User.find(uid)
  end

  private
   def post_params 
    params.require(:post).
      permit(:title,:topic_id,:content)
   end
end
