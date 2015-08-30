ActiveAdmin.register Battle do
  menu priority: 4

  permit_params :start, :first_fighter_id, :second_fighter_id, :winner_id

  index do
    selectable_column
    id_column
    column :start
    column :first_fighter
    column :second_fighter
    column :winner
    actions
  end

  filter :start
  filter :first_fighter
  filter :second_fighter
  filter :winner

  form do |f|
    f.inputs form_title('Battle') do
      f.input :start, as: :datetime_picker, local: true
      f.input :first_fighter
      f.input :second_fighter
      f.input :winner
    end
    f.actions
  end

end
