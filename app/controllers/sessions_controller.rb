class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:home, :new, :create, :omni_signin]

    def home
    end
    
    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:alert] = "Login Credentials Do Not Match Records"
            redirect_to "/login"
        end
    end

    def omni_signin
        @user = User.find_or_create_by(uid: auth[:uid], provider: auth[:provider]) do |u|
            u.username = auth[:info][:name]
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex(15)
        end
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/'
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    private 
    
    def auth
        request.env['omniauth.auth']
    end
end