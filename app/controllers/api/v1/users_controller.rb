class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      user.create_api_key
      render json: UserSerializer.new(user).serializable_hash
    else
      error = user.errors.full_messages.to_sentence
      type = user.errors.details.to_s
      title = user.errors.details.keys.to_s
      render json: {
          "errors": [
            {
              "status": "400",
              "source": type,
              "title":  title,
              "detail": error
            }
          ]
        }
    end
  end

  private

  def user_params
     params.permit(:email, :password, :password_confirmation)
  end
end
