module Concerns::SpoonacularHelper
  def ingredient_request(ingredient_name)
    response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/food/ingredients/autocomplete?number=100&query=#{ingredient_name}",
            headers:{
              "X-RapidAPI-Host" => "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
              "X-RapidAPI-Key" => ENV["SPOONACULAR_KEY"]
            }
    response.body.map{|ingredient| Ingredient.create(name: ingredient["name"])}
  end
end
