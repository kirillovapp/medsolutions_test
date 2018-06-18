ActiveAdmin.register News do
  menu priority: 1, parent: 'Новости', label: 'Статьи'

  permit_params :title, :text

  form do |f|
    f.inputs '' do
      f.input :title
      f.input :text
    end
    f.actions
  end

  # Index filters
  filter :title
  filter :created_at

  # Index block
  index do
    column :title
    column :created_at
    actions
  end
end
