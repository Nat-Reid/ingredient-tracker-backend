class Api::V1::UserIngredientsController < ApplicationController
  def create
  end
  
  private

  def user_ingredient_params
    params.require(:user_ingredient).permit(:ingredient_id,:user_id,:expiration_date,:quantity)
  end
end
