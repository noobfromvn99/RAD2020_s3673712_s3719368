class Post < ApplicationRecord
    validates :title, presence: true,length: { maximum: 100 }
    validates :content, presence: true,length: { maximum: 1000 }
    belongs_to :user
    belongs_to :topic
    has_many :comments, dependent: :destroy
    mount_uploader :picture, PictureUploader
  
    scope :order_by_date, -> { order(created_at: :desc)}
    scope :order_by_viewed, -> {order("viewed DESC")}
end
