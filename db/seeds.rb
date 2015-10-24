# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Menu.destroy_all
Category.destroy_all

first_category = Category.create!(name: "First course")
main_category = Category.create!(name: "Main course")
drink_category = Category.create!(name: "Drink")

Menu.create!([
{
title: "Borsh",
price: "70" ,
category: first_category
},
{
title: "Pizza",
price: "200" ,
category: first_category
},
{
title: "Sushi",
price: "180" ,
category: first_category
},
{
title: "Pasta",
price: "230" ,
category: main_category
},
{
title: "Salad",
price: "220" ,
category: main_category
},
{
title: "Big_bon",
price: "120" ,
category: main_category
},
{
title: "Vodka",
price: "666" ,
category: drink_category
},
{
title: "Coca-Cola",
price: "50" ,
category: drink_category
},
{
title: "Green Tea",
price: "10" ,
category: drink_category
}
])