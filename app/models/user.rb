class User < ApplicationRecord
    has_secure_password
    before_save :downcase_email
    
    validates :name, presence: true, length: { in: 4..12 }, uniqueness: true
    validates :email, presence: true, length: { maximum: 100 }, email: true, 
                        uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { in: 6..20 }

    def downcase_email
        self.email = email.downcase
    end

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

end
