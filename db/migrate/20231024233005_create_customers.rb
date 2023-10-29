class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.integer :user, foreign_key: true
      t.string :name
      t.date :birthday
      t.text :allergy
      t.text :memo

      t.timestamps
    end
  end
end
