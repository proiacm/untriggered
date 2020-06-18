class Entry < ApplicationRecord
    belongs_to :user 
    belongs_to :emotion
    accepts_nested_attributes_for :emotion, reject_if: :all_blank
end
