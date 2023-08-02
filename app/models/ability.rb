# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if current_user.admin?
      can :manage, :all
    else
      can :read, Character
    end
  end
end
