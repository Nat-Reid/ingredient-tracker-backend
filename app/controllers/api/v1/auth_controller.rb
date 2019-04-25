class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:login]

  def login
    @user = Api::V1::User.find_by(username: user_login_params[:username])
    if @user&.authenticate(user_login_params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: Api::V1::UserSerializer.new(@user), jwt: token}, status: :accepted
    else
      render json: {message: "Invalid Login Information"}, status: :unauthorized
    end
  end

  private

  def user_login_params
    params.permit(:username, :password)
  end
end
