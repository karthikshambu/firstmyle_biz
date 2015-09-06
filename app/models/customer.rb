class Customer < ActiveRecord::Base
  attr_accessible :address, :apartment_id, :consumer_id, :customer_type_id, :email, :name, :neighborhood_id, :organization_id, :street_id

  STATUS = [
            NEW = "New",
            INPROGRESS = "Inprogress",
            SUCCESS = "Success",
            FAILURE = "Failure",
            MAPPED = "Mapped"
            ]

	def self.import(file)
		CSV.foreach(file.path,headers: true) do |row|
			Customer.create! row.to_hash
		end
	end 

end
