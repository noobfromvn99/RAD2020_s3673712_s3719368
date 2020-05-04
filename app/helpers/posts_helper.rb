module PostsHelper
    def getTopic(id)
        Topic.find(id).name
    end

    def get_topic_id(name)
        Topic.all.each do |topic|
            topic.id if getTopic(topic.id) == name
        end
    end

    def increaseViewed(post)
        post.viewed += 1 #update the view number here
        post.save
    end

    def get_user(user_id)
        User.find(user_id)
    end

    def get_post(post_id)
        Post.find(post_id)
    end

    def get_comment(comment_id)
        Comment.find(comment_id)
    end

    def get_main_comment(post)
        post.comments.where("comment_id = ?", nil)
    end
end
