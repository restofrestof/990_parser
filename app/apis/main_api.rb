# frozen_string_literal: true

require 'grape-swagger'

# The main API class. Mount your APIs here
class MainApi < Grape::API
  format :json
  prefix :api

  # Version 1
  class V1Api < Grape::API
    version 'v1', using: :path
    mount V1::HealthApi
    mount V1::FilingApi
    mount V1::UploadFilingApi
    mount V1::RecipientApi
    mount V1::ResetSystemApi
  end

  mount V1Api
end
