class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.boolean :status
      t.string :species
      t.string :typee
      t.string :gender
      t.string :origin_name
      t.string :origin_url
      t.string :location_name
      t.string :location_url
      t.string :image
      t.string :created

      t.timestamps
    end
  end
end
