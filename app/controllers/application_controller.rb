class ApplicationController < ActionController::Base

    def welcome 
        if user_signed_in?
            redirect_to emotions_path
        end
    end

end
