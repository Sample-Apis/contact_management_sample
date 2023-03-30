class Group < ApplicationRecord
  attr_accessor :contact_ids

  has_and_belongs_to_many :contacts
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id

  validates :name, presence: true
end
