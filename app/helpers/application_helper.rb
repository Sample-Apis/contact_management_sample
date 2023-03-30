# Using for additional helper methods
module ApplicationHelper
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def authenticate_api
    authenticate_or_request_with_http_token do |token, _options|
      if token == APP_CONFIG['app_token']
        @current_user = {}
      else
        render json: { meta: { code: I18n.t('response_status.authentication_error'),
                               errorDetail: I18n.t('response_message.authentication_error') } }
      end
    end
  end
end
