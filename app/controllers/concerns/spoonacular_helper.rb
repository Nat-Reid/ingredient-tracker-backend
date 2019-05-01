module Concerns::SpoonacularHelper
  def baseURL
    'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/'
  end

  def ingredient_request(ingredient_partial_name)
    HTTParty.get()
  end
end
