class StudentsController < ApplicationController

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @student = @user.students.build
        else
            @student = Student.new
        end
    end

    def index
        params[:user_id] && @user = User.find_by_id(params[:user_id])
        @students = @user.students.alpha
    end

    def create
        @student = current_user.students.build(student_params)
        if @student.save
            redirect_to students_path
        else
            render :new
        end
    end

    def show
        @student = Student.find_by(id: params[:id])
    end

    private

    def student_params
        params.require(:student).permit(:first_name, :last_name, :birth_date, :grade_level, :career_goal, :user_id)
    end

end
