# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "killing everything"
Ingredient.destroy_all

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")
Ingredient.create(name: "vodka")
Ingredient.create(name: "cream")
Ingredient.create(name: "kahluhua")

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = open(url).read
user = JSON.parse(ingredients)

# data = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
# parsed = JSON.parse(data)

puts 'Seed DB'
user['drinks'].each do |line|
  ingredient_name = line['strIngredient1']
  Ingredient.create!(name: ingredient_name)
end
puts 'Done'
