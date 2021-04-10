class User < ApplicationRecord
    has_secure_password
    before_save :downcase_email
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :name, presence: true, length: { in: 4..12 }, uniqueness: true
    validates :email, presence: true, length: { maximum: 100 }, 
                       format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { in: 6..20 }

    def downcase_email
        self.email = email.downcase
    end

end
