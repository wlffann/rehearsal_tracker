class CompaniesController < ApplicationController
  
  def show
    @company = Company.find(params[:id])
  end
  
  def new 
    @company = Company.new
  end

  def create
    company = Company.new(company_params)
    if company.save
      flash[:success] = "Your company has been created!"
      redirect_to company_path(company)
    else
      flash[:warning] = "Please fill in all the required fields"
      render :new
    end
  end

  private
    def company_params
      params.require('company').permit('name', 'location', 'logo_url')
    end
end
