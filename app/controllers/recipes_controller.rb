class RecipesController < ApplicationController
  include Concerns::SpoonacularHelper

  def generate
    render recipe_request(@user.ingredients_by_expiration_dates)
  end
end
