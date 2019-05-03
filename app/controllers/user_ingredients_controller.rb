class UserIngredientsController < ApplicationController

  def index
    render json: @user.user_ingredients, each_serializer: UserIngredientSerializer
  end

  def create
    # byebug
    @user_ingredient = @user.user_ingredients.build(user_ingredient_params)
    if @user_ingredient.save
      render json: {user_ingredient: UserIngredientSerializer.new(@user_ingredient)}, status: 201
    else
      render json: {message: @user_ingredient.errors.full_messages}, status: 422
    end
  end

  private

  def user_ingredient_params
    params.require(:user_ingredient).permit(:ingredient_id,:expiration_date,:quantity)
  end

end
