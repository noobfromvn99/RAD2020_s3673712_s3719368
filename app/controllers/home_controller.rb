class HomeController < ApplicationController
  def index
    @user = current_user
    @posts = Post.all.order(:created_at) #here, and then in html u do @posts.each do
  end
end
