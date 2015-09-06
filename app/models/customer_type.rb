class CustomerType < ActiveRecord::Base
  attr_accessible :description, :file, :name, :organization_id, :status
end
