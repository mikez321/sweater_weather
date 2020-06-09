class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: login_params[:email])
    if user.nil?
      error_hash = ErrorGenerator.user_not_found
      render json: error_hash, status: :bad_request
    elsif !user.authenticate(login_params[:password])
      error_hash = ErrorGenerator.invalid_user
      render json: error_hash, status: :bad_request
    elsif user.authenticate(login_params[:password])
      render json: UserSerializer.new(user)
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
