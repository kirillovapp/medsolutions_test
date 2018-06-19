ActiveAdmin.register News do
  menu priority: 1, parent: 'Новости', label: 'Статьи'

  permit_params :title, :text, specialization_ids: [], city_ids: []

  form do |f|
    f.inputs '' do
      f.input :title
      f.input :text
      f.input :cities, include_blank: true, hint: "hold shift to select multiple items"
      f.input :specializations, include_blank: true, hint: "hold shift to select multiple items"
    end
    f.actions
  end

  # Index filters
  filter :title
  filter :cities
  filter :specializations
  filter :created_at

  # Index block
  index do
    column :title
    column "Cities" do |one_news|
      one_news.cities.map(&:title).join(', ').html_safe
    end
    column "Specializations" do |one_news|
      one_news.specializations.map(&:title).join(', ').html_safe
    end
    column :created_at
    actions
  end
end
