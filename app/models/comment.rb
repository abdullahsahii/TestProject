class Comment < ApplicationRecord
  belongs_to :character
  def self.ransackable_attributes(auth_object = nil)
    ["character_id", "comment", "created_at", "id", "person_name", "updated_at"]
  end
end
