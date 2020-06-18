class Emotion < ApplicationRecord
    has_many :entries 
    has_many :users, through: :entries
    validates_presence_of :name
end
