class News < ApplicationRecord
  has_and_belongs_to_many :audiences

  scope :by_city, -> (city) { left_joins(:cities).where(cities: { id: [city.id, nil] }) if city.present? }
  scope :by_specializations, -> (specializations) { left_joins(:specializations)
              .where(specializations: { id: [specializations.pluck(:id), nil] }) if specializations.present? }

  def self.for_user(user)
    by_city(user.city).by_specializations(user.specializations)
  end
end
