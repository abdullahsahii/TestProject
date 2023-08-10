ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end


  index do
    selectable_column
    id_column
    column :email
    column :name
    column :password_confirmation
    actions
  end

end
