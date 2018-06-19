class News < ApplicationRecord
  has_and_belongs_to_many :audiences

  scope :for_audiences, -> (audiences) { left_joins(:audiences)
                           .where(audiences: { id: [audiences.map(&:id), nil] }) if audiences.present? }
end
