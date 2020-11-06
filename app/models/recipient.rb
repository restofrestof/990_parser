class Recipient < ActiveRecord::Base
  has_many :awards
  has_many :granters, through: :awards, inverse_of: :recipients
  has_many :filings, through: :awards, inverse_of: :recipients
end
