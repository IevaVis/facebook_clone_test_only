class Status < ActiveRecord::Base
	default_scope { order(created_at: :desc) }
	belongs_to :user
	has_many :likes, dependent: :destroy
	validates :content, :title, presence: true
	validates :content, length: { minimum: 10, message: "content is too short" }
	validates :title, length: { minimum: 8, message: "title is too short" }

end
