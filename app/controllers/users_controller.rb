class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.includes(:students).find_by(id: params[:id])
        redirect_to '/' if !@user
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
