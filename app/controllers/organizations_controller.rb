class OrganizationsController < ApplicationController

  def index
  end
  
  def upload_csv
  end 

  def import_file
    rowarray = Array.new    
    rowarrayHeader = Array.new
    myfile = params[:file]
    counter=0
    CSV.foreach(myfile.path) do |row|
      if counter == 0
        rowarrayHeader << row
        @header = rowarrayHeader
        counter = counter + 1
      else
       rowarray << row
      @rowarraydisp = rowarray          
      counter = counter + 1
    end
    end 
   @rowarraydisp.each do |row|
    flag=check_existing_customer(row[0],row[2])
    if flag.zero?
    @customer=Customer.new
    @customer.name = row[0]    
    @customer.email =row[1]
    @customer.phone_no=row[2]
    @customer.save
    @customerfield=CustomerField.new
    @customerfield.field_value=row[3]
    @customerfield.field_type="string"
    @customerfield.field_name=@header[0][3]
    @customerfield.customer_id = @customer.id
    @customerfield.save
  else
    @customer=Customer.new
    @customer.email=row[1]
    @customer.save
    end
  end
end

 def check_existing_customer(name,phone_no)
      if Customer.exists?(name: name,phone_no: phone_no) 
      puts 88888888888888888888888 
         return 1
        else
          puts 777777777777777777777777777
        return 0
      end 
    end
 end
