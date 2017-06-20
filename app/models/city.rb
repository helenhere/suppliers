class City < ActiveRecord::Base
  validates :name, presence: true

  has_many :suppliers
  has_many :customers
  has_many :orders
end
