class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :posts
	has_many :commentaries
	
	validates :name, presence: true
	validates :name, length: {maximum: 16, minimum: 2}
	validates :name, uniqueness: true
	validates :name, format: {with: /\w+/i, message: 'only letters allowed'}

	validates :email, presence: true
	validates :email, format: {with: /.+@.+\..+/i, message: 'incorrect email format'}
end
