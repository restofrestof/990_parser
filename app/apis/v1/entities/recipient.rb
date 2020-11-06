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
    end
  end
end