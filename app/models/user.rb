class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
            uniqueness: { case_sensitive: false, allow_nil: true }
  validates_length_of :phone, is: 10, message: "#{I18n.t('user.phone_length')}"

  has_many :contacts, class_name: 'Contact', foreign_key: :owner_id
  has_many :groups, class_name: 'Group', foreign_key: :owner_id
  has_one_attached :profile_picture, dependent: :destroy
end
