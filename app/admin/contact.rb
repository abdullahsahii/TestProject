ActiveAdmin.register Contact do
  permit_params :question, :answers
  form do |f|
    f.inputs do
      f.input :question
      f.input :answers
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :question
    column :answers
    actions
  end
end
