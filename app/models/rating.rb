class Rating < ApplicationRecord
  belongs_to :character
  belongs_to :user
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "rating", "updated_at"]
  end
end
