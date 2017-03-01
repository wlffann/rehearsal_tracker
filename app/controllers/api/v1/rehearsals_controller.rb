class Api::V1::RehearsalsController < ActionController::API
  def update
    rehearsal = Rehearsal.find(params[:id])
    rehearsal.update(rehearsal_params)
    redirect_to company_production_rehearsal_path(rehearsal.production.company.name, rehearsal.production.title, rehearsal.id)
  end

  private
    def rehearsal_params
      params.require('rehearsal').permit('description', 'location', 'date')
    end
end
