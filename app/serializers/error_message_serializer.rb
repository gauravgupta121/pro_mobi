class ErrorMessageSerializer
  def initialize(error_code, field, error_message = '')
    @error_code = error_code
    @field = field
    @error_message = error_message
  end

  def serialized_json
    {
      errors: [{
        source: { pointer: @field },
        detail: @error_message,
        code: @error_code
      }]
    }
  end
end