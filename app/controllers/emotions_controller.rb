class EmotionsController < ApplicationController

    before_action :not_user

    def index 
        @emotions = current_user.emotions
    end

    def show 
      @emotion = current_user.emotions.find_by_id(params[:id])
      @entries = @emotion.entries
    end

end
