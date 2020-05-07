class Comment < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :content, presence: true,length: { maximum: 10000 }
  default_scope -> { order(created_at: :desc)}

end
