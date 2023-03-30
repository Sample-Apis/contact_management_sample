class ApplicationController < ActionController::API
  include JwtToken

  before_action :authenticate_user

  def authenticate_user
    header = request.headers['Authorization']
    if header.present?
      token = header.split('Token token=').last
      decoded_token = decode(token)
      user_id = decoded_token.dig(:user_id)
      session[:user_id] = user_id
    else
      render json: { meta: { code: I18n.t('response_status.authentication_error'),
                             errorDetail: I18n.t('response_message.authentication_error') } }
    end
  rescue StandardError => e
    render json: { meta: { code: I18n.t('response_status.authentication_error'),
                           errorDetail: e.message } }
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
