class Api::V1::UserIngredient < ApplicationRecord
  belongs_to :user, class_name: "Api::V1::User", foreign_key: "api_v1_user_id"
  belongs_to :ingredient, class_name: "Api::V1::Ingredient", foreign_key: "api_v1_ingredient_id"
end
