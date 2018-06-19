ActiveAdmin.register Audience do
  menu priority: 100, label: 'Аудитории'

  permit_params :title, :description, city_ids: [], specialization_ids: [], profession_status_ids: []

  form do |f|
    f.inputs '' do
      f.input :title
      f.input :description
      f.input :cities, include_blank: true, hint: "hold shift to select multiple items"
      f.input :specializations, include_blank: true, hint: "hold shift to select multiple items"
      f.input :profession_statuses, include_blank: true, hint: "hold shift to select multiple items"
    end
    f.actions
  end

  # Index filters
  filter :title
  filter :cities
  filter :specializations
  filter :profession_statuses
  filter :created_at

  # Index block
  index do
    column :title
    column "Cities" do |audience|
      audience.cities.map(&:title).join(', ').html_safe
    end
    column "Specializations" do |audience|
      audience.specializations.map(&:title).join(', ').html_safe
    end
    column "Profession Statuses" do |audience|
      audience.profession_statuses.map(&:title).join(', ').html_safe
    end
    column :created_at
    actions
  end
end
