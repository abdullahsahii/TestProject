class AddColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :integer, default: 0
    add_column :users, :name, :string
  end
end
