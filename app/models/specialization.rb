class Specialization < ActiveRecord::Base
  has_and_belongs_to_many :news
  has_and_belongs_to_many :doctors
end