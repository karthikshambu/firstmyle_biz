class Customer < ActiveRecord::Base
  attr_accessible :datetime, :email, :name, :phone_no, :string
end
