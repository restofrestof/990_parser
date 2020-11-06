class Recipient < ActiveRecord::Base
  has_many :awards, inverse_of: :recipient
  has_many :granters, through: :awards, inverse_of: :recipients

  validates :name, :ein, presence: true
end
