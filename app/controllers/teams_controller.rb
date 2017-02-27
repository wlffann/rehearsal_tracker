class TeamsController < ApplicationController 
  
 def new
   @company = Company.find(params[:company_id])
   @production = @company.productions.find(params[:production_id])
   @team = @production.teams.new
 end

  def create
    company = Company.find(params[:company_id])
    production = company.productions.find(params[:production_id])
    team = production.teams.new(team_params)
    if team.save
      flash[:success] = 'Your team was created!'
      redirect_to company_production_path(company.name, production.title)
    else
      flash[:danger] = 'Please fill in all required fields.'
      render :new
    end
  end

  private
    def team_params
      params.require('team').permit('name')
    end
end
