module ApplicationHelper
  def needed_ingredients(recipe_food)
    quantity = recipe_food.quantity - recipe_food.food.quantity
    return unless quantity.positive?

    { name: recipe_food.food.name, quantity: "#{quantity} #{recipe_food.food.measurement_unit}",
      price: recipe_food.food.price * quantity }
  end

  def total_price(recipe_foods)
    total_price = 0
    recipe_foods.each do |rf|
      next unless needed_ingredients(rf)

      total_price += needed_ingredients(rf)[:price]
    end
    total_price
  end

  def total_ingredients(recipe_foods)
    total_ingredients = 0
    recipe_foods.each do |rf|
      total_ingredients += 1 if needed_ingredients(rf)
    end
    total_ingredients
  end

  def total_price_recipe(recipe)
    total_price = 0
    recipe_ingredients = RecipeFood.includes([:food]).where(recipe: recipe)
    recipe_ingredients.each do |ri|
      total_price += ri.food[:price] * ri[:quantity].to_i
    end
    total_price
  end

  def total_ingredients_recipe(recipe)
    total_ingredients = 0
    recipe_ingredients = RecipeFood.includes([:food]).where(recipe: recipe)
    recipe_ingredients.each do |ri|
      total_ingredients += 1 if ri
    end
    total_ingredients
  end
end
