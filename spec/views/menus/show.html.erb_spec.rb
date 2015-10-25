require 'rails_helper'

RSpec.describe 'menus/show', type: :view do
  before(:each) do
    @menu = assign(:menu, Menu.create!(
                            menu: 'Menu',
                            title: 'Title',
                            price: 1
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Menu/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
  end
end
