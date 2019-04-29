class UserIngredientSerializer < ActiveModel::Serializer
  attributes :id, :expiration_date, :quantity, :name
  belongs_to :ingredient
end
