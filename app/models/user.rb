class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :foods, foreign_key: :user_id, dependent: :destroy
  has_many :recipes, foreign_key: :user_id, dependent: :destroy
  validates :name, presence: true

  Roles = %i[admin default].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end
end
