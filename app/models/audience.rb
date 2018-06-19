class Audience < ApplicationRecord
  has_and_belongs_to_many :cities
  has_and_belongs_to_many :specializations
  has_and_belongs_to_many :profession_statuses
end
