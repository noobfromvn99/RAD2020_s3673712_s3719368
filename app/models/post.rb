class Post < ApplicationRecord
    validates :title, presence: true,length: { maximum: 100 }
    validates :content, presence: true,length: { maximum: 1000 }
    belongs_to :user
    belongs_to :topic
    has_many :comments, dependent: :destroy
    mount_uploader :picture, PictureUploader

    default_scope -> { order(created_at: :asc)}
end
