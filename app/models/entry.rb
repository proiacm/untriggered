class Entry < ApplicationRecord
    belongs_to :user 
    belongs_to :emotion
    accepts_nested_attributes_for :emotion, reject_if: :all_blank
    validates_presence_of :content
    scope :current_week, -> { where('DATE(created_at) >= ?', 7.days.ago) }
end
