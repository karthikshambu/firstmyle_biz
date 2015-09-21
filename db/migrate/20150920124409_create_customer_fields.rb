class CreateCustomerFields < ActiveRecord::Migration
  def change
    create_table :customer_fields do |t|
      t.string :field_type
      t.string :field_name
      t.string :field_value
      t.references :customer

      t.timestamps
    end
    add_index :customer_fields, :customer_id
  end
end
