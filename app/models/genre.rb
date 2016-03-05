class Genre < ActiveRecord::Base

  #Validations
  validates_presence_of :name

  ##Relations
  has_many :movies
end
