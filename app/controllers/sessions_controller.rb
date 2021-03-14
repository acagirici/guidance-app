class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:home, :new, :create]

    def home
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Login Credentials Do Not Match Records"
            render 'new'
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

end