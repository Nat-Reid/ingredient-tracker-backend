class UserIngredientsController < ApplicationController

  def index
    render json: @user.ingredients
  end


end
