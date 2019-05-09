module Concerns::SpoonacularHelper
  def ingredient_request(ingredient_name)
    path = "food/ingredients/autocomplete?metaInformation=true&number=10&query=#{ingredient_name}"

    if (ingredient_name.match(/^[a-z ]+$/))
      response = unirest_get(path)
      {json: create_ingredients(response), each_serialzer: IngredientSerializer}
    else
      {json: {message: "Only letters can be used"}, status: :bad_request}
    end
  end

  def recipe_request(ingredient_list)
    query = ingredient_list.map(&:name).join('%2C').gsub(" ","%20")
    puts "RECIPE QUERY:" + query
    path = "/recipes/findByIngredients?number=5&limitLicense=true&ranking=1&ignorePantry=false&ingredients=#{query}"

    response = unirest_get(path)
    {json: create_recipes(response), each_serialzer: RecipeSerializer}
  end

  def create_ingredients(response)
    response.body.map do |ingredient|
      Ingredient.find_by(id: ingredient["id"]) || Ingredient.create(name: ingredient["name"], id: ingredient["id"])
    end
  end

  def create_recipes(response)
    recipes = response.body.map do |recipe_hash|
      recipe = Recipe.find_or_create_by(id: recipe_hash["id"], name: recipe_hash["title"])
      recipe.url ||= unirest_get("recipes/#{recipe.id}/information").body["sourceUrl"]
      recipe_hash["missedIngredients"].each do |i|
        ingredient = Ingredient.find_by(id: i["id"]) || Ingredient.create(id: i["id"], name: i["name"])
        recipe.ingredients << ingredient unless recipe.ingredient_ids.include?(ingredient.id)
      end
      recipe_hash["usedIngredients"].each do |i|
        ingredient = Ingredient.find_by(id: i["id"]) || Ingredient.create(id: i["id"], name: i["name"])
        recipe.ingredients << ingredient unless recipe.ingredient_ids.include?(ingredient.id)
      end
      recipe
    end
    puts "RECIPES FROM RESPONSE:" + recipes.map(&:name).to_s
    return recipes
  end

  def unirest_get(path)
    api_message
    Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/#{path}",
            headers:{
              "X-RapidAPI-Host" => "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
              "X-RapidAPI-Key" => ENV["SPOONACULAR_KEY"]
            }
  end

  def api_message
    5.times do
      puts 'HITTING API HITTING API HITTING API'
    end
  end
end
