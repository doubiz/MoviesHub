class Rating < ActiveRecord::Base

  ##Validations
  validates_presence_of :movie, :user, :value
  validates_uniqueness_of :user_id, scope: :movie_id, message: "Already rated this movie before"

  ##Relations
  belongs_to :movie
  belongs_to :user
end
