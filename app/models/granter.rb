class Granter < ApplicationRecord

  validates :name, :ein, presence: true
end
