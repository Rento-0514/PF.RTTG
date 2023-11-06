class AddMembershipAndCompanyToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :membership, :text
    add_column :customers, :company, :text
  end
end
