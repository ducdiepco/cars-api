class Resolvers::BaseResolver < GraphQL::Function

  def graphql_errors(errors)
    GraphQL::ExecutionError.new(parse_errors(errors))
  end

  private

  def parse_errors(errors)
    return errors.message if errors.respond_to?(:exception)
    parsed_errors = {}
    get_errors(errors).each do |error|
      parsed_errors.merge!("#{error.first}" => error.last.first)
    end
    parsed_errors
  end

  def get_errors(errors)
    if errors.errors.respond_to?(:messages)
      errors.errors.messages
    else
      errors.errors
    end
  end
end
