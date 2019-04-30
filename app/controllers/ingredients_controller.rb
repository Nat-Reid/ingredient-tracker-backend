class IngredientsController < ApplicationController
  include Concerns::SpoonacularHelper

  skip_before_action :authorized

  def show
    ingredient_request
    render json: {message: "ingredient request made"}
  end

  def find
    @ingredient = Ingredient.find_by(name: params[:ingredient_name])
    if !@ingredient
      @matching_ingredients = Ingredient.where("ingredients.name  ~* ?", params[:ingredient_name].downcase)
      if @matching_ingredients.blank?
        render json: ingredient_request #from SpoonacularHelper
      else
        render json: @matching_ingredients, each_serialzer: IngredientSerializer
      end
    else
      render json: [IngredientSerializer.new(@ingredient)]
    end
  end
end
