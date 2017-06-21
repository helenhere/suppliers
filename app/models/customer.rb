class Customer < ActiveRecord::Base
  attr_accessor :email, :password

  VALID_PHONE_NUMBER = /0[569][035-9](\d){7}/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, format: { with: VALID_PHONE_NUMBER }, uniqueness: true
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true
  # has_secure_password
  validates :city_id, presence: true

  has_many :orders
  belongs_to :city

  # attr_accessor :remember_token

  # class << self
  #   def digest (string)
  #     cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  #         BCrypt::Engine.cost
  #     BCrypt::Password.create(string, cost: cost)
  #   end
  #
  #   def new_token
  #     SecureRandom.urlsafe_base64
  #   end
  # end
  #
  # def remember
  #   self.remember_token = User.new_token
  #   update_attribute(:remember_digest, Customer.digest(remember_token))
  # end
  #
  # # Returns true if the given token matches the digest.
  # def authenticated?(remember_token)
  #   return false if remember_digest.nil?
  #   BCrypt::Password.new(remember_digest).is_password?(remember_token)
  # end
  #
  # # Forgets a user.
  # def forget
  #   update_attribute(:remember_digest, nil)
  # end
end
