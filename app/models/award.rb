class Award < ApplicationRecord
  has_one :granter
  has_one :recipient

  validates :granter, :recipient, presence: true
end
