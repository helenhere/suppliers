class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :datetime_of_purchase

      t.belongs_to :city, foreign_key: city_id
      t.belongs_to :customer, foreign_key: customer_id
      t.belongs_to :supplier, foreign_key: supplier_id

      t.timestamps null: false
    end
  end
end
