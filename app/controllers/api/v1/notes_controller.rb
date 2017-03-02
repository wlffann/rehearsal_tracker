class Api::V1::NotesController < ActionController::API 
  def index
    rehearsal = Rehearsal.find(params[:rehearsal_id])
    render json: rehearsal.notes
  end

  def create
    rehearsal = Rehearsal.find(params[:rehearsal_id])
    note = rehearsal.notes.new(note_params)
    if note.save
      render json: note
    else
      render status: 500, json: "Error"
    end
  end

  private
    def note_params
      params.require('note').permit('content', 'team_id', 'status')
    end
end
