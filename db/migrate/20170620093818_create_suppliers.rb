class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :first_name
      t.string :last_name
      t.string :product_name
      t.string :phone
      t.string :company

      t.belongs_to :city, foreign_key: true

      t.timestamps null: false
    end
  end
end
