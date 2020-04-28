class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, 
               length: { maximum: 255 },
               format: { with: VALID_EMAIL_REGEX },
               uniqueness: { case_sensitive: false }
    before_save { self.email = self.email.downcase }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    VALID_MOBILE_REGEX = /\d/
    validates :mobile, presence: true,
               length: { minimum:10, maximum: 10},
               format: { with: VALID_MOBILE_REGEX } 
    has_many :posts, dependent: :destroy

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                            BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
