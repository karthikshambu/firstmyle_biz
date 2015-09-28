class OrganizationsController < ApplicationController

  def index
  end
  
  def upload_csv
  end  

  def upload    
  end 

  def save_header
   @customer=Customer.new
    @customerfield=CustomerField.new(params[:customerfield])

    @header.each do |i|
    i.each do |j|
    if @customer.has_attribute?(j) 
      else
        @customerfield.field_name=j
        @customerfield.field_type="string"
        #customerfield=CustomerField.new(params[:customerfield])
        customerfield.save    
    end
   end 
 end 
  end

  def import_file   
    @customer=Customer.new
    @customerfield=CustomerField.new
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
   end 
   #@rowarraydisp.each do |row|   
    #flag=check_existing_customer(row[0],row[2])
    #if flag.zero?
    #@customer=Customer.new
    #@header[0] = row[0]
    #0..(row.length - 1).each do |i|
    #  @header[i] #key
    #  row[i] #value
    #end
    #@customer.name = row[0]    
    #@customer.email =row[1]
    #@customer.phone_no=row[2]
    #@customer.save
    #@customerfield=CustomerField.new
    #@customerfield.field_value=row[3]
    #@customerfield.field_type="string"
    #@customerfield.field_name=@header[0][3]
    #@customerfield.customer_id = @customer.id
    #@customerfield.save
  #else
    #@customer=Customer.new
    #@customer.email=row[1]
    #@customer.save
   # end
  #end
end


