# frozen_string_literal: true

module Api
  module V1
    # Signin user
    class SessionsController < Devise::SessionsController
      include ApplicationHelper
      include JwtToken

      before_action :authenticate_api
      skip_before_action :authenticate_user

      def create
        user = User.find_by('LOWER(email) = ?', session_params[:email].downcase)
        if user.present?
          if user.valid_password?(session_params[:password])
            token = encode(user_id: user.id)
            render json: { meta: { code: I18n.t('response_status.success'), user: UserSerializer.new(user.reload),
                                   token: token } }
          else
            render json: { meta: { code: I18n.t('response_status.authentication_error'),
                                   message: I18n.t('response_message.user_signing_failed') } }
          end
        else
          render json: { meta: { code: I18n.t('response_status.authentication_error'),
                                 message: I18n.t('response_message.user_signing_failed') } }
        end
      end

      private

      def session_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
