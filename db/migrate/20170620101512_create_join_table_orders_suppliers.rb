class CreateJoinTableOrdersSuppliers < ActiveRecord::Migration
  def change
    create_join_table :orders, :suppliers do |t|
      # t.index [:order_id, :supplier_id]
      # t.index [:supplier_id, :order_id]
    end
  end
end
