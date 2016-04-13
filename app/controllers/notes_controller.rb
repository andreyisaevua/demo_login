class NotesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @note = current_user.notes.build if signed_in?
    @notes = []
    if current_user
      @notes = current_user.notes.paginate(page: params[:page], per_page: 5)
    end
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      flash[:success] = 'Note created!'
      redirect_to root_path
    else
      @notes = []
      if current_user
        @notes = current_user.notes.paginate(page: params[:page], per_page: 5)
      end
      render 'index'
    end
  end

  def destroy
    @note.destroy
    redirect_to root_path
  end

  private
    def note_params
      params.require(:note).permit(:content)
    end

    def correct_user
      @note = current_user.notes.find_by(id: params[:id])
      redirect_to root_path if @note.nil?
    end

end
