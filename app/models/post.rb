class Post < ApplicationRecord
    validates :title, presence: true,length: { maximum: 200 }
    validates :content, presence: true,length: { maximum: 10000 }
    belongs_to :user
end
