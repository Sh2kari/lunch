class LineItem < ActiveRecord::Base
  belongs_to :menu
  belongs_to :cart
  belongs_to :order
end
