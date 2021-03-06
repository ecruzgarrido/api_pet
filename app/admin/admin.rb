ActiveAdmin.register Admin do
  menu priority: 2
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

  filter :email
  filter :created_at

  form do |f|
    f.inputs form_title('Admin') do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
