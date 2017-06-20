class CreateJoinTableSuppliersCity < ActiveRecord::Migration
  def change
    create_join_table :suppliers, :cities do |t|
      # t.index [:supplier_id, :city_id]
      # t.index [:city_id, :supplier_id]
    end
  end
end
