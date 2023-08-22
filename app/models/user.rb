class User < ApplicationRecord
  acts_as_taggable_on :skills, :experiences
  validates :name, presence: true
  validates :email, uniqueness: true
  enum role: { user: 0, admin: 1 }
  has_many :characters
  has_many :contacts
  has_many :user_comments


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
