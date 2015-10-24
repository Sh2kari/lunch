class Cart < ActiveRecord::Base
  has_many :line_items

  def add_menu_item(menu_id)
    current_item = line_items.find_by(menu_id: menu_id)
    current_item = line_items.build(menu_id: menu_id)
  end

  def total_price
    line_items.to_a.sum{ |item| item.menu.price }
  end
end
