class ProfessionStatus < ActiveRecord::Base
  has_and_belongs_to_many :audiences
end
