class PostsController < ApplicationController
  def new
    if current_user == nil
      redirect_to root_url
    end
  end

  def create
  end

  def show
  end
end
