class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { error: @user.errors.full_messages}, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :name)
  end
end
