class Company::RehearsalsController < ApplicationController
  load_and_authorize_resource
  def show
    company = Company.find_by(name: params[:company_name])
    production = company.productions.where(title: params[:production_title]).first
    @rehearsal = production.rehearsals.where(id: params[:id]).first
  end

  def update
    company = Company.find_by(name: params[:company_name])
    production = company.productions.where(title: params[:production_title]).first
    rehearsal = production.rehearsals.new(rehearsal_params)
    if rehearsal.save
      flash[:success] = "Rehearsal updated"
      redirect_to company_production_rehearsal_path(company.name, production.title, rehearsal.id)
    else
      flash[:danger] = "Please fill in a description"
      render :show
    end
  end

  private
  def rehearsal_params 
    params.require('rehearsal').permit('date', 'location', 'description')
  end
end
