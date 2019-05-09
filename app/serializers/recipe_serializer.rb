class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_minutes, :url
  has_many :ingredients
end
