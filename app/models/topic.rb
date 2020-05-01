class Topic < ApplicationRecord
    has_many :posts
    scope :ordered, -> {
        joins(:posts).order("viewed DESC").limit(2)
    }
end
