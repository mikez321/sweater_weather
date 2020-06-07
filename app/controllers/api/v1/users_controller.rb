class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      user.create_api_key
      render json: UserSerializer.new(user).serializable_hash
    else
      error_hash = ErrorGenerator.new(user.errors).error_hash
      render json: error_hash
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
