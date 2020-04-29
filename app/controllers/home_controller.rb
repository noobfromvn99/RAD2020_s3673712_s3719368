class HomeController < ApplicationController
  include PostsHelper
  @@topic_array ||= []

  def index 
    @posts = Post.all
    respond_to do |format|  
      format.js
  end

  def add_topic
   name = params[:name]
    if @@topic_array.include?(name)
      @@topic_array.delete(name)
    else
      @@topic_array.push(name)
    end
  end

  def clear_topic
    redirect_to index_path;
  end

  def filter_index 
    @filter_posts = []
    Post.all.each do |post|
      if @@topic_array.include?(getTopic(post.topic_id))
        @filter_posts.push(post)
      end
    end

    respond_to do |format|  
      format.js
    end
  #  @topic_array = @@topic_array
  #  render 'filter_index'
  end

end