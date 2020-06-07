class ErrorGenerator
  def initialize(user_errors)
    @error = user_errors.full_messages.to_sentence
    @type = user_errors.details.keys.first.to_s
    @title = user_errors.details.keys.to_s
    @status = '400'
  end

  def error_hash
    {
        "errors": [
          {
            "status": @status,
            "source": @type,
            "title":  @title,
            "detail": @error
          }
        ]
      }
  end

end
