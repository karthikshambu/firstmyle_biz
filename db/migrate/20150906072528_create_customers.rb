class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :customer_type_id
      t.integer :consumer_id
      t.integer :street_id
      t.integer :apartment_id
      t.integer :neighborhood_id
      t.string :name
      t.string :email
      t.integer :organization_id
      t.string :address

      t.timestamps
    end
  end
end
