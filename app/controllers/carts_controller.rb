class CartsController < ApplicationController
  before_action :find_cart, only: [:show, :destroy, :update, :edit]

  def index
    @carts = Cart.all
  end

  def show
  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(params[:cart])
    if @cart.save
      redirect_to carts_path
    end
  end

  def update
    if @cart.update(params[:cart])
      redirect_to @cart
    end
  end

  private

  def find_cart
    @cart = Cart.find(params[:id])
  end
end
