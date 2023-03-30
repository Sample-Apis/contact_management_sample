# frozen_string_literal: true

module Api
  module V1
    # Register a new user
    class RegistrationsController < Devise::RegistrationsController
      include ApplicationHelper

      before_action :authenticate_api
      skip_before_action :authenticate_user

      def create
        build_resource(sign_up_params)
        if resource.save
          render json: { meta: { code: I18n.t('response_status.success'),
                                 user: UserSerializer.new(resource.reload) } }
        else
          render json: { meta: { code: I18n.t('response_status.unprocessible_entity'),
                                 message: resource.errors.full_messages.uniq.join(', ') } }
        end
      rescue StandardError => e
        render json: { meta: { code: I18n.t('response_status.unprocessible_entity'), message: e.message } }
      end

      private

      def sign_up_params
        params.require(:user).permit(
          :first_name,
          :last_name,
          :email,
          :password,
          :phone,
          :profile_picture
        )
      end
    end
  end
end
