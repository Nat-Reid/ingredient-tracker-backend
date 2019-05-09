class RecipesController < ApplicationController
  include Concerns::SpoonacularHelper

  def generate
    puts "selected ingredients:" + selected_ingredients.to_s
    @recipe_ingredients = @user.ingredients_by_expiration_dates
    render recipe_request(@recipe_ingredients)
  end

  def selected_ingredients
    params[:user_ingredients]&.map{|id| UserIngredient.find_by(:id)}&.select { |ui| ui.user == @user }
  end
end
