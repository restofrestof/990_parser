class Award < ActiveRecord::Base
  has_one :granter
  has_one :recipient

  validates :granter, :recipient, presence: true
end
