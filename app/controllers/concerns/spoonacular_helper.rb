module Concerns::SpoonacularHelper
  def ingredient_request(ingredient_name)
    if (ingredient_name.match(/^[[:alpha:][:blank:]]+$/))
      byebug
      response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/food/ingredients/autocomplete?number=10&query=#{ingredient_name}",
              headers:{
                "X-RapidAPI-Host" => "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
                "X-RapidAPI-Key" => ENV["SPOONACULAR_KEY"]
              }
      {json: response.body.map{|ingredient| Ingredient.create(name: ingredient["name"])}}
    else
      {json: {message: "Only letters can be used"}, status: :bad_request}
    end
  end
end
