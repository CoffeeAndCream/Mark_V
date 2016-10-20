class User < ApplicationRecord
  validates :name, uniqueness: true
  validates :email, uniqueness: true
  validates :password, length: { in: 6..20 }
  has_secure_password
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
