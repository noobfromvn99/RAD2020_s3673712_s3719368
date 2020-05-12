class Verfication < ApplicationRecord
  validates :fullname, presence: true,length: { maximum: 50 }
  validates :cardnum, presence: true,length: { maximum: 10 }
  belongs_to :user
  mount_uploader :card, CardUploader
end
