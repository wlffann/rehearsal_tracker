class Company::RehearsalsController < ApplicationController
  def show
    company = Company.find_by(name: params[:company_name])
    production = company.productions.where(title: params[:production_title]).first
    @rehearsal = production.rehearsals.where(id: params[:id]).first
  end
end
