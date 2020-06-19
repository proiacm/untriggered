class Entry < ApplicationRecord
    belongs_to :user 
    belongs_to :emotion
    accepts_nested_attributes_for :emotion, reject_if: :all_blank
    validates_presence_of :content
    scope :recent, -> { where('DATE(created_at) >= ?', 1.days.ago) }
end
