class Contact < ApplicationRecord
  validates :question, presence: true
  def self.ransackable_attributes(auth_object = nil)
    ["answers", "created_at", "id", "question", "updated_at"]
  end
end
