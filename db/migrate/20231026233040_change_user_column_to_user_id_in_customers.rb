class ChangeUserColumnToUserIdInCustomers < ActiveRecord::Migration[7.0]
  def change
    change_table :customers do |t|
      t.rename :user, :user_id
    end

    add_foreign_key :customers, :users
  end
end
