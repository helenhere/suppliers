class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :password
      t.string :remember_digest
      t.string :password_digest

      t.belongs_to :city, foreign_key: true, column: city_id

      t.timestamps null: false
    end
  end
end
