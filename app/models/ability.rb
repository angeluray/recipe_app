class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    # Define User abilities
    if user.is? :admin
      can :manage, Recipe do |recipe|
        recipe.user_id == user.id
      end
      can :read, Recipe, &:public
      can :create, Food
      can :destroy, Food do |food|
        food.user_id == user.id
      end
    else
      can :read, Food
      can :read, Recipe, &:public
    end
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
