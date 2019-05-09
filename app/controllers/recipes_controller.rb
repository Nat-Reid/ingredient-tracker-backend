class RecipesController < ApplicationController
  include Concerns::SpoonacularHelper

  def generate
    puts "selected ingredients:" + selected_ingredients.map(&:name).to_s
    @recipe_ingredients = selected_ingredients + @user.ingredients_by_expiration_dates
    @recipe_ingredients = @recipe_ingredients[0..6]
    puts "recipe ingredients: " + @recipe_ingredients.to_s
    render recipe_request(@recipe_ingredients[0..6])
  end

  def selected_ingredients
    params[:selected_ingredient_ids]&.map{|id| UserIngredient.find_by(id: id)}&.select { |ui| ui.user == @user }.map(&:ingredient)
  end
end
