class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :require_login
    helper_method :current_user, :user_authenticated

    private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def user_authenticated
        !!current_user
    end

    def require_login
        unless user_authenticated
            flash[:error] = "You Must Be logged in to access this page"
            redirect_to root_path
        end
    end

end
