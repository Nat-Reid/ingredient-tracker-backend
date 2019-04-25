class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = Api::V1::User.new(user_params)
    if @user.save
      render json: { user: Api::V1::UserSerializer.new(@user) }, status: :created
    else
      render json: { error: @user.errors.full_messages}, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :name)
  end
end
