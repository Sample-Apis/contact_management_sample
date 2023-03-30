class Api::V1::ContactsController < ApplicationController
  include UploadContacts

  def upload
    response = upload_contacts(current_user&.id)
    if response[:error].present?
      render json: { meta: { code: I18n.t('response_status.unprocessible_entity'),
                             errorDetail: response[:error] } }
    else
      render json: { meta: { code: I18n.t('response_status.success'),
                             message: I18n.t('user.contacts_uploaded') } }
    end
  end
end
