class CustomerField < ActiveRecord::Base
  belongs_to :customer
  attr_accessible :field_name, :field_type, :field_value
end
