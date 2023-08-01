class AddCharacterReferenceToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :character, null: false, foreign_key: true
  end
end
