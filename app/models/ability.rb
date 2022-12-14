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

# class Ability
#   include CanCan::Ability

#   def initialize(user)
#     user ||= User.new
#     # Define User abilities
#     if user.is? :admin
#       can :manage, Recipe do |recipe|
#         recipe.user_id == user.id
#       end
#       can :read, Recipe, &:public
#       can :create, Food
#       can :destroy, Food do |food|
#         food.user_id == user.id
#       end
#     else
#       can :read, Food
#       can :read, Recipe, &:public
#     end
#   end
# end
