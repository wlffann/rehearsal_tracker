class CompaniesController < ApplicationController
  load_and_authorize_resource

  def show
    @company = Company.find_by(name: params[:company_name])
  end
  
  def new 
    @company = Company.new
  end

  def create
    company = Company.new(company_params)
    if company.save
      company.company_managers.create(user: current_user)
      flash[:success] = "Your company has been created!"
      redirect_to company_path(company.name)
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
