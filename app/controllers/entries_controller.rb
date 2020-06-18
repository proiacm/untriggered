class EntriesController < ApplicationController

    before_action :not_user
    before_action :find_entry, only: [:show, :edit, :update, :destroy]

    def index
        if params[:emotion_id]
            @emotion = Emotion.find_by_id(params[:emotion_id])
            @entries = @emotion.entries
        else
            @entries = current_user.entries
        end
    end

    def new 
        @emotion = Emotion.find_by(id: params[:emotion_id])
        if @emotion
            @entry = Entry.new(emotion_id: params[:emotion_id])
        else
            redirect_to emotions_path
        end     
    end   

def create 
        @entry = current_user.entries.build(entry_params)
        if @entry.save
            redirect_to @entry 
        else
            render :new
        end
    end

    def show 
        if !@entry 
            redirect_to entries_path
        end
    end

    def edit 
    end

    def update
       if @entry.update(entry_params) 
        redirect_to @entry
       else
        render :edit
       end
    end

    def destroy
        @entry.delete
        redirect_to root_path
    end

    private 

    def entry_params
        params.require(:entry).permit(:content, :emotion_id, emotion_attributes: [
            :name
        ])
    end

    def find_entry 
        @entry = current_user.entries.find_by_id(params[:id])
    end

end
