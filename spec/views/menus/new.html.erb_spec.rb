require 'rails_helper'

RSpec.describe "menus/new", type: :view do
  before(:each) do
    assign(:menu, Menu.new(
      :menu => "MyString",
      :title => "MyString",
      :price => 1
    ))
  end

  it "renders new menu form" do
    render

    assert_select "form[action=?][method=?]", menus_path, "post" do

      assert_select "input#menu_menu[name=?]", "menu[menu]"

      assert_select "input#menu_title[name=?]", "menu[title]"

      assert_select "input#menu_price[name=?]", "menu[price]"
    end
  end
end
