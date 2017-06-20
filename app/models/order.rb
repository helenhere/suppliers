class Order < ActiveRecord::Base
  validates_datetime :datetime_of_purchase
  validates :city_id, presence: true
  validates :customer_id, presence: true
  validates :supplier_id, presence: true

  belongs_to :customer
  belongs_to :supplier
  belongs_to :order
end
