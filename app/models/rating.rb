class Rating < ActiveRecord::Base

  ##Validations
  validates_presence_of :movie_id, :user_id, :value
  validates_uniqueness_of :user_id, scope: :movie_id, message: "Already rated this movie before"

  ##Relations
  belongs_to :movie
  belongs_to :user
end
