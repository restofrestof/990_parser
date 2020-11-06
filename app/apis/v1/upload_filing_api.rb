module V1
  class UploadFilingApi < Grape::API
    resource :upload_filings do
      desc 'Create new filing'
      params do
        requires :filing_url
      end
      get do
        uri = URI(params[:filing_url])
        if uri.is_a?(URI::HTTP) && !uri.host.nil?
          filing = FilingProcessor::Conductor.new(Net::HTTP.get(uri)).filing
          if filing.status == Filing::COMPLETED_STATUS
            present filing, with: V1::Entities::FilingCreate
          else
            error! filing.status, 400
          end
        else
          error! 'Invalid URL', 400
        end
      end
    end
  end
end
