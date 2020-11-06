module V1
  class FilingApi < Grape::API
    resource :filings do
      desc 'Get details of filings'
      get do
        filings = Filing.where(status: Filing::COMPLETED_STATUS)
        present filings, with: V1::Entities::FilingIndex
      end
      desc 'Get filing by id'
      route_param :id do
        get do
          filing = Filing.find(params[:id])
          present filing, with: V1::Entities::Filing
        end
      end
      desc 'Create new filing'
      params do
        requires :filing_url
      end
      get do
        uri = URI(params[:filing_id])
        if uri.is_a?(URI::HTTP) && !uri.host.nil?
          filing = FilingProcessor.new(URL(uri)).filing
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
