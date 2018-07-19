class CreateConfirmations < ActiveRecord::Migration[5.1]
  def change
    create_table :confirmations do |t|
      t.references :offerer, index: true, foreign_key: {to_table: :user}
      t.references :requester, index: true, foreign_key: {to_table: :user}
      t.timestamps
    end
  end
end
