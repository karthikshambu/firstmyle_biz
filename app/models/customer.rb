class Customer < ActiveRecord::Base
  attr_accessible :datetime, :email, :name, :phone_no, :string

 # def self.import(file)
 # spreadsheet = open_spreadsheet(file)  
 # header = spreadsheet.row(1)
 # (2..spreadsheet.last_row).each do |i|
 #   row = Hash[[header, spreadsheet.row(i)].transpose]
 # end
 #end



 #def check_existing_customer(name,phone_no)
  #    if Customer.exists?(name: name,phone_no: phone_no) 
   #   puts 88888888888888888888888 
    #     return 1
     #   else
      #    puts 777777777777777777777777777
      #  return 0
    #  end 
  #  end
#end

 #def update_fields
  #flag = check_existing_customer(customer_type, row)
   # if flag.zero?
    #new_customer_count += 1 

    #customer = find_by_id(row["id"]) || new
    #customer.attributes = row.to_hash.slice(*accessible_attributes)
    #customer.save!
  #end

    
  end