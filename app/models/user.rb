class User < ActiveRecord::Base
  ##Attribute accessors
  attr_accessor :avatar_url
  ##Devise 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable

  ##Uploader
  mount_uploader :avatar, Users::AvatarUploader

  ##Enum for different account types
  enum account_type: {user: 0, admin: 1}

  ##Validations
  validates_presence_of :name, :email, :account_type

  ##Relations
  has_many :user_movies
  has_many :movies, through: :user_movies
  has_many :not_watched_movies, -> {where(user_movies: {state: 0})}, through: :user_movies, source: :user
  has_many :liked_movies, -> {where(user_movies: {state: 1})}, through: :user_movies, source: :user
  has_many :disliked_movies, -> {where(user_movies: {state: 2})}, through: :user_movies, source: :user
  has_many :authentication_tokens
  has_many :ratings

  ##Callbacks
  before_validation :check_for_remote_avatar

  ##Instance Methods

  ##Class Methods

  private

  ##Instance Methods
  def check_for_remote_avatar
    self.remote_avatar_url = self.avatar_url if self.avatar_url.present?
  end

end
