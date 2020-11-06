class Granter < ActiveRecord::Base
  has_many :awards, inverse_of: :granter
  has_many :recipients, through: :awards, inverse_of: :granters

  validates :name, :ein, presence: true
end
