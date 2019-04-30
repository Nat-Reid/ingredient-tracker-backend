module Concerns::SpoonacularHelper
  def baseURL

  end

  def ingredient_request(ingredient_name)
    HTTParty.get()
  end
end
