class Movie < ActiveRecord::Base
  ##Validations
  validates_presence_of :name

  ##Relations
  belongs_to :genre
  belongs_to :user
  has_many :ratings

  ##Instance Methods
  def rating
    ratings = self.ratings.pluck(:value)
    ratings.length > 0 ? (ratings.reduce(0, :+).to_f / ratings.length).round(1) : 0
  end

end
