class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Recipe, user: user
    can :manage, Recipe, user: user
    can :manage, Food, user: user
    can :manage, RecipeFood, user: user
    return unless user.role == 'admin'

    can :manage, :all
  end
end
