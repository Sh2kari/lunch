require 'rails_helper'

RSpec.describe "menus/edit", type: :view do
  before(:each) do
    @menu = assign(:menu, Menu.create!(
      :menu => "MyString",
      :title => "MyString",
      :price => 1
    ))
  end

  it "renders the edit menu form" do
    render

    assert_select "form[action=?][method=?]", menu_path(@menu), "post" do

      assert_select "input#menu_menu[name=?]", "menu[menu]"

      assert_select "input#menu_title[name=?]", "menu[title]"

      assert_select "input#menu_price[name=?]", "menu[price]"
    end
  end
end
