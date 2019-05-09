class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_minutes
  has_many :ingredients
end
