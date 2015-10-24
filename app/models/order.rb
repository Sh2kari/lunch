class Order < ActiveRecord::Base
  has_many :line_items

  validates_presence_of :name, :price, :email

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def self.total_price
    self.sum{|item| item.price }
  end
end
