class RehearsalsController < ApplicationController
  load_and_authorize_resource params_method: :sanitize_rehearsal 
  def new
    @company = Company.find(params[:company_id])
    @production = @company.productions.where(id: params[:production_id]).first
    @rehearsal = Rehearsal.new 
  end

  def create
    company = Company.find(params[:company_id])
    production = company.productions.where(id: params[:production_id]).first
    rehearsal = production.rehearsals.new(rehearsal_params) 
    if rehearsal.save
      flash[:success] = "New rehearsal created!"
      redirect_to company_production_rehearsal_path(company.name, production.title, rehearsal.id)
    else
      flash[:danger] = "Please fill in all required fields"
      render :new
    end
  end
  
  private
  def sanitize_rehearsal
    params.require('rehearsal').permit('date', 'location', 'description')
  end
end
