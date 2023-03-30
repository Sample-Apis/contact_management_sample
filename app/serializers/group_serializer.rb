# Group response serialize
class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :number_of_contacts

  def number_of_contacts
    object.contacts.count
  end
end
