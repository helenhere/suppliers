class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :date_of_purchase
      t.time :time_of_purchase

      t.timestamps null: false
    end
  end
end
