class ApplicationController < ActionController::Base

    helper_method :not_user

    def welcome 
        if user_signed_in?
            redirect_to emotions_path
        end
    end

    private 

    def not_user
        if !user_signed_in?
            redirect_to root_path
        end
    end
end
