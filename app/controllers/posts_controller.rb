class PostsController < ApplicationController

  def new
    
  if current_user == nil
    redirect_to root_url
  else
    @post = current_user.posts.new
  end
   
  end

  def create
  end

  def show
  end
end
