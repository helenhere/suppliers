class CreateJoinTableOrderCity < ActiveRecord::Migration
  def change
    create_join_table :orders, :cities do |t|
      # t.index [:order_id, :city_id]
      # t.index [:city_id, :order_id]
    end
  end
end
