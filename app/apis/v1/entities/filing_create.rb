module V1
  module Entities
    class FilingCreate < Grape::Entity
      expose :id
      expose :status
    end
  end
end