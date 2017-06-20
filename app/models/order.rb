class Order < ActiveRecord::Base
  validates_date :date_of_purchase
  validates_time :time_of_purchase
  validates :city_id, presence: true
  validates :customer_id, presence: true
  validates :supplier_id, presence: true

  belongs_to :customer, :supplier, :order
end
