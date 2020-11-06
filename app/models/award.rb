class Award < ActiveRecord::Base
  belongs_to :granter
  belongs_to :recipient
  belongs_to :filing

  validates :granter, :recipient, :amount, :purpose, presence: true
end
