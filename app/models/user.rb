class User < ApplicationRecord
  validates :email, uniqueness: true
  enum role: { user: 0, admin: 1 }
  has_many :characters
  has_many :user_comments
  def self.ransackable_attributes(auth_object = nil)
    ["age", "confirmation_sent_at", "confirmation_token", "confirmed_at", "created_at", "email", "encrypted_password", "id", "name", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "unconfirmed_email", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["characters", "user_comments", "rating"]
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
