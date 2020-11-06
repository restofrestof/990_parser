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
          present filing, using: V1::Entities::Filing
        end
      end
    end
  end
end
