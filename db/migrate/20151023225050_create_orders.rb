class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.integer :price

      t.timestamps null: false
    end
  end
end
