class Audience < ApplicationRecord
  has_and_belongs_to_many :cities
  has_and_belongs_to_many :specializations
  has_and_belongs_to_many :profession_statuses
  has_and_belongs_to_many :audiences

  scope :by_city, -> (city) { left_joins(:cities).where(cities: { id: [city.id, nil] }) if city.present? }
  scope :by_specializations, -> (specializations) { left_joins(:specializations)
             .where(specializations: { id: [specializations.pluck(:id), nil] }) if specializations.present? }
  scope :by_profession_status, -> (profession_status) { left_joins(:profession_statuses)
            .where(profession_statuses: { id: [profession_status.id, nil] }) if profession_status.present? }

end
