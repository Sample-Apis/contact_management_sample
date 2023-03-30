class Api::V1::GroupsController < ApplicationController
  def create
    group = Group.new(group_params.merge!(owner_id: current_user.id))
    if group.save
      render json: { meta: { code: I18n.t('response_status.success'), group: GroupSerializer.new(group) } }
    else
      render json: { meta: { code: I18n.t('response_status.unprocessible_entity'),
                             errorDetail: group.errors.full_messages.join(', ') } }
    end
  end

  def add_contacts
    contact_ids = params[:contact_ids]
    contact_ids.each do |contact_id|
      contact = Contact.find_by(id: contact_id)
      next if contact.blank? || group_details.contacts.include?(contact)

      group_details.contacts << contact
    end
    render json: { meta: { code: I18n.t('response_status.success'), group: GroupSerializer.new(group_details) } }
  rescue StandardError => e
    render json: { meta: { code: I18n.t('response_status.unprocessible_entity'),
                           errorDetail: e.message } }
  end

  def list_contacts
    contacts = group_details.contacts
    render json: { meta: { code: I18n.t('response_status.success'), contacts: contacts } }
  rescue StandardError => e
    render json: { meta: { code: I18n.t('response_status.unprocessible_entity'),
                           errorDetail: e.message } }
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

  def group_details
    Group.find_by(id: params[:group_id])
  end
end
