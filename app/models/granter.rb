class Granter < ActiveRecord::Base

  validates :name, :ein, presence: true
end
