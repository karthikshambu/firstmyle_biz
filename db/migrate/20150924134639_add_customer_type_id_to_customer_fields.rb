class AddCustomerTypeIdToCustomerFields < ActiveRecord::Migration
  def change
    add_column :customer_fields, :customer_type_id, :integer
  end
end
