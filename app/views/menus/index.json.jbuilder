json.array!(@menus) do |menu|
  json.extract! menu, :id, :menu, :title, :price
  json.url menu_url(menu, format: :json)
end
