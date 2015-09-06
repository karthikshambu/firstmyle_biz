class CreateCustomerTypes < ActiveRecord::Migration
  def change
    create_table :customer_types do |t|
      t.string :name
      t.integer :organization_id
      t.string :description
      t.string :status
      t.string :file

      t.timestamps
    end
  end
end
