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
    redirect_to carts_path if @cart.save
  end

  def update
    redirect_to @cart if @cart.update(params[:cart])
  end

  private

  def find_cart
    @cart = Cart.find(params[:id])
  end
end
