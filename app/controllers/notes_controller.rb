class NotesController < ApplicationController
    def index
        if params[:student_id] && @student = Student.find_by_id(params[:student_id])
            @notes = @student.notes
        else
            #@error = "That Student Doesn't Exist" if params[student_id]
            @notes = Note.all
        end
    end
    
    def new
        if params[:student_id] && @student = Student.find_by_id(params[:student_id])
            @note = @student.notes.build
        else
            @note = Note.new
        end 
    end

    def create
        @note = current_user.notes.build(note_params)
        if @note.save
            redirect_to notes_path
        else
            render :new
        end
    end

    def show
        @note = Note.find_by(id: params[:id])
    end


    private

    def note_params
        params.require(:note).permit(:content, :created_at, :student_id, :user_id)
    end

end
