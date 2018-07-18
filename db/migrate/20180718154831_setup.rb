class Setup < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
    end

    create_table :requests do |t|
      t.references :user, index: true
      t.text :description
      t.string :aasm_state
    end

    create_table :offers do |t|
      t.references :user, index: true
      t.integer :karma_points
      t.text :description
      t.string :aasm_state
    end

    create_table :transactions do |t|
      t.references :offer
      t.string :aasm_state
    end
  end
end
