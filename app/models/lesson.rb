class Lesson < ActiveRecord::Base
    belongs_to :school
    validates :school_id, presence: true
    validates :lesson_date, presence: true
end
