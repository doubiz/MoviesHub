class UserMovie < ActiveRecord::Base
  ##Enum
  enum state: {not_watched: 0, liked: 1, disliked: 2}

  ##Validations
  validates_presence_of :movie, :user
  validates_uniqueness_of :user_id, scope: :movie_id, message: "Already added this movie before"

  ##Relations
  belongs_to :movie 
  belongs_to :user
end 
