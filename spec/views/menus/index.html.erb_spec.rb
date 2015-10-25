require 'rails_helper'

RSpec.describe 'menus/index', type: :view do
  before(:each) do
    assign(:menus, [
      Menu.create!(
        menu: 'Menu',
        title: 'Title',
        price: 1
      ),
      Menu.create!(
        menu: 'Menu',
        title: 'Title',
        price: 1
      )
    ])
  end

  it 'renders a list of menus' do
    render
    assert_select 'tr>td', text: 'Menu'.to_s, count: 2
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 1.to_s, count: 2
  end
end
