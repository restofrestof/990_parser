module V1
  module Entities
    class Award < Grape::Entity
      expose :id
      expose :amount
      expose :purpose
      expose :recipient, using: V1::Entities::Recipient
    end
  end
end