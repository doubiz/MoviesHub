class User < ActiveRecord::Base
  ##Devise 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ##Enum for different account types
  enum account_type: {user: 0, admin: 1}

  ##Validations
  validates_presence_of :name, :email, :account_type
end
