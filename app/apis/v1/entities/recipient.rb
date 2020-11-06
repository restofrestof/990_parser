module V1
  module Entities
    class Recipient < Grape::Entity
      expose :name
      expose :ein
      expose :address
      expose :city
      expose :state
      expose :zip_code
      expose :section
      expose :id
      expose :awards, using: V1::Entities::Award
    end
  end
end