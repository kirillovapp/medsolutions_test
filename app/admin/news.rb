ActiveAdmin.register News do
  menu priority: 1, parent: 'Новости', label: 'Статьи'

  permit_params :title, :text, audience_ids: []

  form do |f|
    f.inputs '' do
      f.input :title
      f.input :text
      f.input :audiences, include_blank: true, hint: "hold shift to select multiple items, blank for all"
    end
    f.actions
  end

  # Index filters
  filter :title
  filter :audiences
  filter :created_at

  # Index block
  index do
    id_column
    column :title
    column "Audiences" do |one_news|
      one_news.audiences.map(&:title).join(', ').html_safe
    end
    column :created_at
    actions
  end
end
