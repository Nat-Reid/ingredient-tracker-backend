class Api::V1::Recipe < ApplicationRecord
  has_and_belongs_to_many :ingredients, class_name: "Api::V1::Ingredient", join_table: "api_v1_ingredients_api_v1_recipes"
end
