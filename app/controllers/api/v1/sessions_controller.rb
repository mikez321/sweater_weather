class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: login_params[:email])
    if user.nil?
      error_hash = ErrorGenerator.new('no_user', 400).user_not_found
      render json: error_hash, status: :bad_request
    elsif !user.authenticate(login_params[:password])
      error_hash = ErrorGenerator.new(user.errors, 400).invalid_user
      render json: error_hash, status: :bad_request
    else user.authenticate(login_params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user)
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
