class School < ActiveRecord::Base
    before_save { self.email = self.email.downcase }
    #validates :name, :phone, :url,   presence: true, length: {maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/in
    validates :email, presence: true, length: {maximum: 255 },
                       format: { with: VALID_EMAIL_REGEX },
                       uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :lessons
    has_many :lessontimes
    
    def appointing(lesson)
      lessontimes.find_or_create_by(appotime: lesson)
    end
    
    def unappointing(lesson)
      lessontime = lessontimes.find_by(appotime: lesson)
      lessontime.destroy if lessontime
    end
    
    def appointing?(lesson)
      lessontimes.exists?(appotime: lesson)
    end
end
