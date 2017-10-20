class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  
	has_many :posts
	has_many :commentaries
	
	validates :name, presence: true
	validates :name, length: {maximum: 80, minimum: 2}
	validates :name, uniqueness: true
	validates :name, format: {with: /\w+/i, message: 'only letters allowed'}

	validates :email, presence: true
	validates :email, format: {with: /.+@.+\..+/i, message: 'incorrect email format'}

  def self.from_omniauth(auth)
    if user = User.where(email: auth.info.email).first
      user
    else
      User.create(email: auth.info.email, password: '111111', name: auth.info.name,
                  provider: auth.provider, uid: auth.uid)

    # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #   user.email = auth.info.email
    #   user.password = '111111'
    #   user.name = auth.info.name
      # user.provider = auth.info.provider
      # user.uid = auth.info.uid
         # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
