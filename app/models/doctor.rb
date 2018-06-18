class Doctor < ActiveRecord::Base
  devise :database_authenticatable, :validatable

  has_and_belongs_to_many :specializations
  belongs_to :city
  belongs_to :profession_status
end
