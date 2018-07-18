class AddTitleToRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :title, :string
  end
end
