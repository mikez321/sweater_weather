class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
      user.create_api_key
      render json: UserSerializer.new(user).serializable_hash
  end

  private

  def user_params
     params.permit(:email, :password, :password_confirmation)
  end
end
