class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :menu,  index: true
      t.belongs_to :cart,  index: true
      t.belongs_to :order, index: true

      t.timestamps null: false
    end
  end
end
