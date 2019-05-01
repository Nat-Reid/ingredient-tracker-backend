module Concerns::SpoonacularHelper
  def ingredient_request(ingredient_name)
    if (ingredient_name.match(/^[a-z ]+$/))
      byebug
      response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/food/ingredients/autocomplete?metaInformation=true&number=10&query=#{ingredient_name}",
              headers:{
                "X-RapidAPI-Host" => "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
                "X-RapidAPI-Key" => ENV["SPOONACULAR_KEY"]
              }
      {json: response.body.map{|ingredient| create_ingredient(ingredient)}, each_serialzer: IngredientSerializer}
    else
      {json: {message: "Only letters can be used"}, status: :bad_request}
    end
  end

  def create_ingredient(ingredient_hash)
    Ingredient.create(name: ingredient["name"], id: ingredient["id"])
  end
end
