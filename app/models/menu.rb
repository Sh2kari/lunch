class Menu < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :orders, through: :line_items

  validates_presence_of :title, :price
  validates_presence_of :title, uniqueness: true

  def self.filter(category_id)
    where('menus.category_id=?', category_id)
  end
end
