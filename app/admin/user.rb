ActiveAdmin.register User do
  menu priority: 3
  permit_params :name, :email, :password, :password_confirmation

  controller do
    # Overwrite create action because it sends an email
    # to created user
    def create
      create! do |success, failure|
        success.html do
          #Deliver welcome email with new Rails 4 feature: Active Job
          UserMailer.welcome(resource).deliver_later
          redirect_to(admin_user_path(resource))
        end
        failure.html do
          render(:new)
        end
      end
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :created_at
    actions
  end

  filter :name
  filter :email
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
