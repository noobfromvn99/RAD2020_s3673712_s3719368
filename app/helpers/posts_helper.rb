module PostsHelper
    def getTopic(id)
        Topic.find(id).name
    end

    def increaseViewed(post)
        post.viewed += 1 #update the view number here
        post.save
    end
end
