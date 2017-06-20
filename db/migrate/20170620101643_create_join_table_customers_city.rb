class CreateJoinTableCustomersCity < ActiveRecord::Migration
  def change
    create_join_table :customers, :cities do |t|
      # t.index [:customer_id, :city_id]
      # t.index [:city_id, :customer_id]
    end
  end
end
