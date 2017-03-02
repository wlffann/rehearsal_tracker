class NotesController < ApplicationController
  def update
    note = Note.find(params[:id])
    if note.update(note_params)
      redirect_to company_production_team_path(note.production.company.name, note.production.title, note.team.id)
    else
      flash[:danger] = "Note not updated"
      render '/company/teams/show'
    end
  end
  
  private
    def note_params
      params.require('note').permit('status', 'content')
    end
end
