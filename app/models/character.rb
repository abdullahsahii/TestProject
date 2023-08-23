class Character < ApplicationRecord
  validates :name, presence: true
  def self.ransackable_attributes(auth_object = nil)
    ["average_rating", "created", "created_at", "gender", "id", "image", "location_name", "location_url", "name", "origin_name", "origin_url", "species", "status", "typee", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user", "user_comments"]
  end

  belongs_to :user
  has_many :user_comments
end