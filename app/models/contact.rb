class Contact < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_and_belongs_to_many :groups

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
end
