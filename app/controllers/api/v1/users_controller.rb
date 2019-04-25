class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
end
