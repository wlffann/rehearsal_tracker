class Company::ProductionsController < ApplicationController
  def show
    company = Company.find_by(name: params[:company_name])
    @production = company.productions.find_by(title: params[:production_title])
  end
end
