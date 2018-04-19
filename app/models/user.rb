class User < ActiveRecord::Base
	has_secure_password

	has_many :statuses, dependent: :destroy
	has_many :likes, dependent: :destroy

	validates :email, :name, :password, :password_confirmation, presence: true
	validates :email, uniqueness: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :password, length: { in: 6..20 }

end