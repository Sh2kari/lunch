class Cart < ActiveRecord::Base
  has_many :line_items

  def add_menu_item(menu_id)
    current_item = line_items.build(menu_id: menu_id)
  end

  def total_price
    line_items.to_a.sum{ |item| item.menu.price }
  end

  def check_category
    counter = 0
    temp = []
    line_items.to_a.each {|item|
      temp[counter] = item.menu.category_id
      counter += 1
    }
    if ((temp[0] === temp[1]) || (temp[0] === temp[2]) || (temp[1] === temp[2]) || (line_items.count > 3))
      return false
    else
      return true
    end
  end
end
