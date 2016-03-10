class Movie < ActiveRecord::Base
  ##Attribute accessor
  attr_accessor :photo_url, :cover_photo_url
  ##Uploader
  mount_uploader :photo, Movies::PhotoUploader
  mount_uploader :cover_photo, Movies::CoverPhotoUploader

  ##Validations
  validates_presence_of :name, :genre

  ##Relations
  belongs_to :genre
  belongs_to :user
  has_many :ratings

  ##Callbacks
  before_validation do 
    check_for_remote_photo
    check_for_remote_cover_photo
  end


  ##Instance Methods
  def rating
    ratings = self.ratings.pluck(:value)
    ratings.length > 0 ? (ratings.reduce(0, :+).to_f / ratings.length).round(1) : 0
  end

  ##Instance Methods

  ##Class Methods

  private

  ##Instance Methods
  def check_for_remote_photo
    self.remote_photo_url = self.photo_url if self.photo_url.present?
  end

  def check_for_remote_cover_photo
    self.remote_cover_photo_url = self.cover_photo_url if self.cover_photo_url.present?
  end

end
