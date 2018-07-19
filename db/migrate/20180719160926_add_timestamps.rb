class AddTimestamps < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :created_at, :datetime, null: false
    add_column :users, :updated_at, :datetime, null: false
    add_column :service_transactions, :created_at, :datetime, null: false
    add_column :service_transactions, :updated_at, :datetime, null: false
    add_column :service_requests, :created_at, :datetime, null: false
    add_column :service_requests, :updated_at, :datetime, null: false
    add_column :offers, :created_at, :datetime, null: false
    add_column :offers, :updated_at, :datetime, null: false
  end
end
