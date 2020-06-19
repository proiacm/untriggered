class EmotionsController < ApplicationController

    before_action :not_user

    def index 
        @emotions = current_user.emotions
        @entries = current_user.entries
    end

    def show 
      @emotion = current_user.emotions.find_by_id(params[:id])
      if @emotion 
          @entries = @emotion.entries
      else
        redirect_to emotions_path
      end
    end

end
