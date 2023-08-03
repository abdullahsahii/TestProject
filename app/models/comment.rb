class Comment < ApplicationRecord
  belongs_to :character
  belongs_to :user
  def self.ransackable_attributes(auth_object = nil)
    ["character_id", "comment", "created_at", "id", "person_name", "updated_at", "user_id"]
  end
end