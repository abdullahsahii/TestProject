ActiveAdmin.register UserComment, type: :admin do
  permit_params :person_name, :comment, :user_id, :character_id, :rating
  form do |f|
    f.inputs do
      f.input :person_name
      f.input :comment
      f.input :character_id
      f.input :user_id
      f.input :rating
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :person_name
    column :comment
    column :character_id
    column :user_id
    column :rating
    actions
  end
end
