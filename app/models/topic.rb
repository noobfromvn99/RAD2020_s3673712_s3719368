class Topic < ApplicationRecord
    has_many :posts
    scope :ordered, -> {
        joins(:posts).group("topics.id").order('SUM(posts.viewed) desc').limit(2).uniq
    }
end
