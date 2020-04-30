module HomeHelper
    def getRecentPost
        oldest_day = 1.month.ago
        @posts = Post.where("created_at >= ?",oldest_day).order("created_at").reverse_order
        return @posts
    end
    
    def get_recent_member
        @User = User.all.order("updated_at").limit(12)
    end

    def get_most_viewed_post
        @posts = Post.all.order("viewed").reverse_order.limit(5)
    end
end
