class Order < ActiveRecord::Base
  # validates :datetime_of_purchase, timeliness: {type: :datetime}

  validates :city_id, presence: true
  validates :customer_id, presence: true
  validates :supplier_id, presence: true

  belongs_to :customer
  belongs_to :supplier
  belongs_to :city
end
