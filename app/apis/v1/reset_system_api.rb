module V1
  class ResetSystemApi < Grape::API
    resource :reset_system do
      desc 'Clears the data out of the system'
      get do
        Award.all.map(&:destroy)
        Recipient.all.map(&:destroy)
        Granter.all.map(&:destroy)
        Filing.all.map(&:destroy)
        { result: :ok }
      end
    end
  end
end
