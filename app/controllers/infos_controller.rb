class InfosController < ApplicationController
  def index
    if params[:filter]
      @menus = Menu.filter(params[:filter]).order("Created_at DESC")
    else
      @menus = Menu.order("Created_at DESC").limit(3);
    end
    @cart = current_cart
  end
end
