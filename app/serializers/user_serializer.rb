# User response serialize
class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :first_name, :last_name, :email, :phone, :profile_picture_url

  def profile_picture_url
    rails_blob_path(object.profile_picture) if object.profile_picture.attached?
  end
end
