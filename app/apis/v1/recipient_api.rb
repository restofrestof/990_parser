module V1
  class RecipientApi < Grape::API
    resource :recipients do
      desc 'Get details of recipients'
      params do
        optional :state
      end
      get do
        recipients = params['state'].present? ? Recipient.where(state: params['state']) : Recipient.all
        present recipients, with: V1::Entities::Recipient
      end
      desc 'Get recipient by id'
      route_param :id do
        get do
          recipient = Recipient.find(params[:id])
          present recipient, with: V1::Entities::Recipient
        end
      end
    end
  end
end
