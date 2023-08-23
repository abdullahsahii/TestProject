require 'csv'

namespace :import do
  desc "Import characters from CSV"
  task characters: :environment do
    csv_path = 'characters.csv'
    CSV.foreach(csv_path, headers: true) do |row|
      Character.create!(
        name: row['Name'],
        status: row['Status'],
        species: row['Species'],
        gender: row['Gender'],
        origin_name: row['Origin name'],
        origin_url: row['Origin url'],
        location_name: row['Location name'],
        location_url: row['Location url'],
        image: row['Image'],
        created: row['Created'],
        created_at: row['Created at'],
        updated_at: row['Updated at'],
        user_id: 1
      )
    end

    puts "CSV data imported successfully!"
  end
end
