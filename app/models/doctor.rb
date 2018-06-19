class Doctor < ActiveRecord::Base
  devise :database_authenticatable, :validatable

  has_and_belongs_to_many :specializations
  belongs_to :city
  belongs_to :profession_status

  def audiences
    Audience.by_city(self.city).by_specializations(self.specializations).by_profession_status(self.profession_status)
  end
end
