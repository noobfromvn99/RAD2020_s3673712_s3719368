class Post < ApplicationRecord
    validates :title, length: { maximum: 50 }
    validates :content, length: { maximum: 255 }
    belongs_to :user
    
end
