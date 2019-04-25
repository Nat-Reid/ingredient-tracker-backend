class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:login]

  def login
    @user = User.find_by(username: user_login_params[:username])
  end

  private

  def user_login_params
    params.require(:username, :password)
  end
end
