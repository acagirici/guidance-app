class StudentsController < ApplicationController

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @student = @user.students.build
        else
            @student = Student.new
        end
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @students = @user.students.alpha_order
        else
            @students = Student.alpha_order
        end
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

    def edit
        @student = Student.find_by_id(params[:id])
        if !@student || @student.user != current_user
            redirect_to students_path
            flash[:notice] = "You may not edit a student you didn't create"
        end
      end
    
      def update
         @student = Student.find_by(id: params[:id])
        redirect_to students_path if !@student || @student.user != current_user 

        if @student.update(student_params)
          redirect_to student_path(@student)
        else
          render :edit
          
        end
      end

    private

    def student_params
        params.require(:student).permit(:first_name, :last_name, :birth_date, :grade_level, :career_goal, :user_id)
    end

end
