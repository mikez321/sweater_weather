class ErrorGenerator
  def initialize(user_errors)
    @status = '400'
    @source = user_errors.details.keys.join(", ")
    @title = user_errors.details.flat_map { |error, deets| deets }
    @error = user_errors.full_messages.to_sentence
  end

  def error_hash
    {
        "errors": [
          {
            "status": @status,
            "source": @source,
            "title":  @title,
            "detail": @error
          }
        ]
      }
  end

end
