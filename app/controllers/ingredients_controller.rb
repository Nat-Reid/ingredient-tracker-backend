class IngredientsController < ApplicationController
  include Concerns::SpoonacularHelper

  skip_before_action :authorized

  def find
    @matching_ingredients = Ingredient.where("ingredients.name  ~ ?", params[:ingredient_name].downcase)
    if @matching_ingredients.blank?
      render ingredient_request(params[:ingredient_name]) #from SpoonacularHelper
    else
      render json: @matching_ingredients, each_serialzer: IngredientSerializer
    end
  end
end
