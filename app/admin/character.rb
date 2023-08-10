ActiveAdmin.register Character do
  permit_params :name, :status, :species, :type, :gender, :origin_name, :origin_url, :location_name, :location_url, :image, :created, :user_id
  form do |f|
    f.inputs do
      f.input :name
      f.input :status
      f.input :species
      f.input :gender
      f.input :origin_name
      f.input :origin_url
      f.input :location_name
      f.input :location_url
      f.input :image
      f.input :created
      f.input :user_id, as: :select, collection: User.all.map { |u| [u.email, u.id] }
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column :status
    column :species
    column :gender
    column :origin_name
    column :origin_url
    column :location_name
    column :location_url
    column :image
    column :created
    column :user_id
    actions
  end
end
