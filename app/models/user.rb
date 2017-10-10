class User < ApplicationRecord
	has_many :posts
	has_many :commentaries
	
	validates :name, presence: true
	validates :name, length: {maximum: 16, minimum: 2}
	validates :name, uniqueness: true
	validates :name, format: {with: /\w+/i, message: 'only letters allowed'}
end
