class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :phone_no
      t.string :string
      t.datetime :datetime

      t.timestamps
    end
  end
end
