class LineItemsController < ApplicationController
  def create
    @cart = current_cart
    menu = Menu.find(params[:menu_id])
    @line_item = @cart.add_menu_item(menu.id)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to root_path }
        format.js
      end
    end
  end
end
