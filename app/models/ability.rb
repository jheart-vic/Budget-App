class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    return unless user.present?

    # can :manage, :all
    can :manage, Group, user: user
    can :manage, Budget, user:user
    #   return unless user.admin?
    #   can :manage, :all
  end
end
