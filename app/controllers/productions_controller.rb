class ProductionsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @production = Production.new
  end

  def create
    company = Company.find(params[:company_id])
    production = company.productions.new(production_params)
    if production.save
      flash[:success] = "Your production was created!"
      redirect_to company_production_path(company.name, production.title)
    else
      flash[:danger] = "Please fill in all required fields."
      render :new
    end
  end

  private
    def production_params
      params.require('production').permit('title', 'season', 'logo_url')
    end
end
