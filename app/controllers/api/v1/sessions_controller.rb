class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: login_params[:email])
    if user.authenticate(login_params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user)
    else
      error_hash = ErrorGenerator.new(user.errors, 400).error_hash
      render json: error_hash, status: :bad_request
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
