class Api::V1::Ingredient < ApplicationRecord
  has_and_belongs_to_many :recipes, class_name: "Api::V1::Recipe", join_table: "api_v1_ingredients_api_v1_recipes"
  has_many :user_ingredients, class_name: "Api::V1::UserIngredient", foreign_key: "api_v1_ingredient_id"
end
