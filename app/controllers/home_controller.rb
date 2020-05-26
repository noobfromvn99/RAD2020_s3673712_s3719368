class HomeController < ApplicationController
  include PostsHelper
  include HomeHelper
  @@topic_array ||= []
  
  def index 
    id = params[:topic_id]
    if(id != nil)
      @posts = Post.where("topic_id = ?", id)
    else 
      @posts = get_recent_post
    end
    respond_to do |format|  
      format.html
      format.js
    end  
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

  def filter_index #showing mutiple topic in index
    @filter_posts = []
    Post.order(created_at: :desc).each do |post|
      if @@topic_array.include?(getTopic(post.topic_id))
        @filter_posts.push(post)
      end
    end

    respond_to do |format|  
      format.js
    end
  end

  def search_index #return the title or
    keyword = params[:search].downcase
    @posts = Post.where("lower(title) like ?", "%#{keyword}%").or(Post.where("lower(content) like ?", "%#{keyword}%"))
  end

end