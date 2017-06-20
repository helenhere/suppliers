class CreateJoinTableOrdersCustomers < ActiveRecord::Migration
  def change
    create_join_table :orders, :customers do |t|
      # t.index [:order_id, :customer_id]
      # t.index [:customer_id, :order_id]
    end
  end
end
