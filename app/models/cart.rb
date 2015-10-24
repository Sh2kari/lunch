class Cart < ActiveRecord::Base
  has_many :line_items

  def total_price
    line_items.to_a.sum{ |item| item }
  end
end
