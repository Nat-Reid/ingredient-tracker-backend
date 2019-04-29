class UserIngredientsController < ApplicationController

  def index
    render json: @user.user_ingredients, each_serializer: UserIngredientSerializer
  end


end
