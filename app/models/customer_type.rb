class CustomerType < ActiveRecord::Base
  attr_accessible :customer_type, :organization_id,:file


  has_many :customer_fields, :dependent => :destroy
  has_many :customers


   def read_header(file)

   	

   	

   end
end
