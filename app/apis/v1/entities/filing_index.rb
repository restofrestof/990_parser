module V1
  module Entities
    class FilingIndex < Grape::Entity
      expose :id
      expose :tax_year
      expose :awards_processed
      expose :granter, using: V1::Entities::Granter
    end
  end
end