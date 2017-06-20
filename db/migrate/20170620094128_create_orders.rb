class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :datetime_of_purchase

      t.belongs_to :city, foreign_key: true
      t.belongs_to :customer, foreign_key: true
      t.belongs_to :supplier, foreign_key: true

      t.timestamps null: false
    end
  end
end
