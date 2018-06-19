class Specialization < ActiveRecord::Base
  has_and_belongs_to_many :doctors
  has_and_belongs_to_many :audiences
end