class MenusController < ApplicationController
  before_action :current_admin
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  respond_to :html

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all
    respond_with(@menus)
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    respond_with(@menu)
  end

  # GET /menus/new
  def new
    @menu = Menu.new
    respond_with(@menu)
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)
    respond_with(@menu)
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    @menu.update(menu_params)
    respond_with(@menu)
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_with(@menu)
  end

  private

    def current_admin
      if !current_user.admin?
        redirect_to root_path, notice: "You are not admin!"
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:title, :price)
    end
end
