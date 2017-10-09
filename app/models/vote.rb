class Vote < ApplicationRecord
	belongs_to :user
  belongs_to :post

  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 1..5 }

  validates :user, presence: true
  validates :post, presence: true
end
