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

end
