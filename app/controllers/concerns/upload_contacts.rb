module UploadContacts
  extend ActiveSupport::Concern

  def upload_contacts(user_id, response = {})
    begin
      if params[:file].present?
        Contact.transaction do
          CSV.foreach(params[:file], headers: true) do |row|
            row = row.to_hash.deep_symbolize_keys
            contact = existing_contact(row[:phone])
            if contact.present?
              Rails.logger.info '************** Contact already exists **************'
              response[:error] = "Contact already exists for phone #{contact[:phone]}"
              break
            else
              Rails.logger.info '*************** Creating contact ****************'
              contact = Contact.new(row.merge(owner_id: user_id))
              contact.save!
              response[:success] = true
            end
          end
        end
      else
        Rails.logger.info '*************** Missing csv file ***************'
        response[:error] = 'Missing csv file'
      end
    rescue StandardError => e
      Rails.logger.info "***************** #{e.message} ****************"
      response[:error] = 'Error uploading csv file'
    end
    response
  end

  private

  def existing_contact(phone)
    Contact.find_by(phone: phone)
  end
end
