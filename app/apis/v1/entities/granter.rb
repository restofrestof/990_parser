module V1
  module Entities
    class Filing < Grape::Entity
      expose :name
      expose :ein
      expose :address
      expose :city
      expose :state
      expose :zip_code
      expose :id
    end
  end
end