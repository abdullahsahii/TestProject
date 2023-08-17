class User < ApplicationRecord
  acts_as_taggable_on :skills, :experience
  validates :name, presence: true
  validates :email, uniqueness: true
  enum role: { user: 0, admin: 1 }
  has_many :characters
  has_many :contacts
  has_many :user_comments

  # Partial tag search method
  def self.partial_tag_search(partial_tag_name)
    matching_users = []

    [:skills, :experience].each do |tag_context|
      ActsAsTaggableOn::Tagging.where(context: tag_context).each do |tagging|
        tag = tagging.tag
        if tag.name.include?(partial_tag_name)
          matching_users.concat(tag.taggings.map(&:taggable))
        end
      end
    end

    matching_users.uniq.select { |user| user.is_a?(User) }
  end

  # Ransack configuration
  def self.ransackable_attributes(auth_object = nil)
    super + ['skills', 'experience']  # Include tags as searchable attributes
  end

  def self.ransackable_associations(auth_object = nil)
    # Include the associations you want to make searchable with Ransack
    # ...
  end

  # Devise configuration
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
