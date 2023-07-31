class Character < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created", "created_at", "gender", "id", "image", "location_name", "location_url", "name", "origin_name", "origin_url", "species", "status", "type", "updated_at", "user_id"]
  end

  belongs_to :user
end
