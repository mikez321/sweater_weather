class ErrorGenerator
  def initialize(user_errors, status)
    return user_not_found if user_errors == 'no_user'
    @status = status
    @source = user_errors.details.keys.join(', ')
    @title = user_errors.details.flat_map { |_error, deets| deets }
    @error = user_errors.full_messages.to_sentence
  end

  def error_hash
    {
      "errors": [
        {
          "status": @status,
          "source": @source,
          "title": @title,
          "detail": @error
        }
      ]
    }
  end

  def user_not_found
    {
      "errors": [
        {
          "status": 400,
          "source": 'user',
          "detail": 'no user found with provided credentials'
        }
      ]
    }
  end

  def invalid_user
    {
      "errors": [
        {
          "status": 400,
          "source": 'password',
          "detail": 'user authentication failed'
        }
      ]
    }
  end
end
