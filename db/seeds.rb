# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def date_rand from = Time.now.to_i - 80000000, to = Time.now.to_i+800000000
  Time.at(from + rand * (to.to_f - from.to_f)).to_date
end

UserIngredient.destroy_all
Ingredient.destroy_all
User.destroy_all


('a'..'z').to_a.each do |letter|
  response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/food/ingredients/autocomplete?metaInformation=true&number=100&query=#{letter}",
          headers:{
            "X-RapidAPI-Host" => "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
            "X-RapidAPI-Key" => ENV["SPOONACULAR_KEY"]
          }
  response.body.map{|ingredient| Ingredient.find_or_create_by(name: ingredient["name"], id: ingredient["id"])}
end

guy = User.create(name: "guy", username: "guyfieri", password: "food_network_king")

6.times do {
  guy.user_ingredients.create(ingredient: Ingredient.all.sample, expiration_date: date_rand, quantity: rand(19)+2)
}
