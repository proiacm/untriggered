class EntriesController < ApplicationController

    before_action :authenticate_user!
    before_action :find_entry, only: [:show, :edit, :update, :destroy]
    before_action :find_emotion, only: [:index, :new]

    def index
        if params[:emotion_id]
            @entries = @emotion.entries
        else
            @entries = current_user.entries
        end
    end

    def new 
        if @emotion
            @entry = Entry.new(emotion_id: params[:emotion_id])
        elsif
            @entry = Entry.new
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
        redirect_to entries_path
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

    def find_emotion
        @emotion = Emotion.find_by_id(params[:emotion_id])
    end

end