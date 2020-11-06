module V1
  module Entities
    class Award < Grape::Entity
      expose :id
      expose :amount
      expose :purpose
      expose :granter_id
      expose :filing_id
      expose :recipient_id
    end
  end
end