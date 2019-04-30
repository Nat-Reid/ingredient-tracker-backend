class IngredientsController < ApplicationController
  include Concerns::SpoonacularHelper

  def show
    ingredient_request
    render json: {message: "ingredient request made"}
  end

  def find
    @matching_ingredients = Ingredient.where("ingredients.name  ~= ?", params[:ingredient_name])
    if !@matching_ingredients.blank?
      render json: @matching_ingredients
    else
      render json: ingredient_request
    end
  end
end
