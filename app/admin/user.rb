ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at,
                :remember_created_at, :created_at, :updated_at, :first_name, :last_name, :age

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    column :updated_at
    column :first_name
    column :last_name
    column :age
    actions
  end

end
