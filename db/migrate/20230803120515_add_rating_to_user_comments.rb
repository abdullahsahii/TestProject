class AddRatingToUserComments < ActiveRecord::Migration[6.1]
  def change
    add_column :user_comments, :rating, :integer
  end
end
