class CustomerField < ActiveRecord::Base
  belongs_to :customer
  belongs_to :customer_type
  attr_accessible :field_name, :field_type, :field_value,:customer_type_id
end
