class IngredientsController < ApplicationController
  include Concerns::SpoonacularHelper

  def show
    ingredient_request
    render json: {message: "ingredient request made"}
  end

  def find
    @ingredient = Ingredient.find_by(name: params[:ingredient_name])
    if @ingredient
      render json: @ingredient
    else
      render json: ingredient_request
    end
  end
end
