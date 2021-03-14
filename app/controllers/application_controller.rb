class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :require_login
    helper_method :current_user

    private

    def require_login
        unless user_authentication
            flash[:error] = "You Must Be logged in to access this page"
            redirect_to root_path
        end
    end

    def user_authentication
        !!current_user
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

end
