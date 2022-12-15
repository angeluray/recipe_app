class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Recipe, user
    can :manage, Recipe, user
    can :manage, Food, user
    can :manage, RecipeFood, user
    return unless user.role == 'admin'

    can :manage, :all
  end
end
