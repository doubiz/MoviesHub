class UserMovie < ActiveRecord::Base
  ##Enum
  enum state: {not_watched: 0, liked: 1, disliked: 2}

  ##Validations
  validates_presence_of :movie, :user
  
  ##Relations
  belongs_to :movie 
  belongs_to :user
end 
