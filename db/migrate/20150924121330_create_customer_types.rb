class CreateCustomerTypes < ActiveRecord::Migration
  def change
    create_table :customer_types do |t|
      t.string :customer_type
      t.integer :organization_id

      t.timestamps
    end
  end
end
