class ChangeRequestsToServiceRequests < ActiveRecord::Migration[5.1]
  def change
    rename_table :requests, :service_requests
    rename_column :offers, :request_id, :service_request_id
    rename_table :transactions, :service_transactions
  end
end
