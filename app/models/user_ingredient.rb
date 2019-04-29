class UserIngredient < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient
  delegate :recipes, :name, to: :ingredient
end
