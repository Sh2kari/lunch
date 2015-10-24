class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.integer :category_id
      t.integer :price

      t.timestamps null: false
    end
  end
end
