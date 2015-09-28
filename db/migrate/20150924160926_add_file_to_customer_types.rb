class AddFileToCustomerTypes < ActiveRecord::Migration
  def change
    add_column :customer_types, :file, :string
  end
end
