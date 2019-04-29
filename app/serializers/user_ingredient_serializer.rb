class UserIngredientSerializer < ActiveModel::Serializer
  attributes :id, :expiration_date, :quantity, :name
end
