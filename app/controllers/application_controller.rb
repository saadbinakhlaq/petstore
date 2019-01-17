class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :forbidden
  rescue_from ActionController::ParameterMissing, with: :bad_request

  private

  def authenticate_request
    authorize_api_request = AuthorizeApiRequest.call(request.headers)
    if authorize_api_request.success?
      @current_user = authorize_api_request.result
    else
      render_error(authorize_api_request.errors, :unauthorized)
    end
  end

  def render_error(messages, status)
    render json: {
      errors: messages
    }, status: status
  end

  def forbidden
    render_error(['Forbidden'], :forbidden)
  end

  def bad_request
    render_error(['Bad Request'], :bad_request)
  end
end
