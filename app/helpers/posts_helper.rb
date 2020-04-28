module PostsHelper
    def getTopic(id)
        Topic.find(id).name
    end
end
