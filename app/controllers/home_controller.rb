class HomeController < ApplicationController
  include PostsHelper
  @@topic_array ||= []
  def index 
    @posts = Post.all.order(:created_at)
    @topic_array = @@topic_array
  end

  def add_topic
   name = params[:name]
    if @@topic_array.include?(name)
      @@topic_array.delete(name)
    else
      @@topic_array.push(name)
    end

   @posts = Post.all
   @topic_array = @@topic_array
   render 'index'
  end

  def filter_index 
    @posts = []
    Post.all.each do |post|
      if(@@topic_array.include?(getTopic(post.topic_id)) )
        @posts.push(post)
      end
    end

    @topic_array = @@topic_array
    render 'filter_index'
  end

end
