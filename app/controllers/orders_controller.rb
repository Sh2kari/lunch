class OrdersController < ApplicationController
  def index
    @orders = Order.paginate(page: params[:page], per_page: 10).order('created_at DESC')
  end

  def create
    @cart = current_cart
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(current_cart)
    @order.price = @cart.total_price
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to root_path, notice: 'Thank you for your order.'
    else
      @cart = current_cart
      render 'new'
    end
  end

  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to root_path, notice: 'Your cart is empty'
      return
    end
    unless @cart.check_category
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to root_path, notice: 'You must pay 1 - first, 1 - main, 1 - drink'
      return
    end
    @order = Order.new
    respond_to do |format|
      format.html
    end
  end

  private

  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to root_path, notice: 'Your cart is empty'
      return
    end
    unless @cart.check_category
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to root_path, notice: 'You must pay 1 - first, 1 - main, 1 - drink'
      return
    end
    @order = Order.new
    respond_to do |format|
      format.html
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :price)
  end
end
