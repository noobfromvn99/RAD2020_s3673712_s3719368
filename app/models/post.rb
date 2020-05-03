class Post < ApplicationRecord
    validates :title, presence: true,length: { maximum: 200 }
    validates :content, presence: true,length: { maximum: 10000 }
    belongs_to :user
    belongs_to :topic
    has_many :comments, dependent: :destroy
    mount_uploader :picture, PictureUploader
end
