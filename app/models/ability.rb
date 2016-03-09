class Ability
  include CanCan::Ability

  def initialize(user)
	  user ||= User.new
	  if user.admin?
			can :manage, :all
		elsif user.user?
			can :read, :all
      can :manage, Rating, user_id: user.id
	  else
			can :read, :all
	  end
  end
end
