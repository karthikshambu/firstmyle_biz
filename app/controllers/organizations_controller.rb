class OrganizationsController < ApplicationController

  def index
  end

  def customers_new
  	@customers = Customer.all
  end	

  def import
    Customer.import(params[:file])
    redirect_to customers_new_organizations_path,notice: "companies added successfully"
  end 



end
