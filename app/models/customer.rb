class Customer < ActiveRecord::Base
  VALID_PHONE_NUMBER = /0[569][035-9](\d){7}/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :first_name, presence: true
  validates :phone, format: { with: VALID_PHONE_NUMBER }, uniqueness: true
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true
  # validates :city_id, presence: true

  has_many :orders
  belongs_to :city
end
