class Movie < ActiveRecord::Base
  ##Validations
  validates_presence_of :name

  ##Relations
  belongs_to :genre
  belongs_to :user

end
