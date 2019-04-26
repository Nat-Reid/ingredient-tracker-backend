class Api::V1::UserIngredientSerializer < ActiveModel::Serializer
  attributes :expiration_date, :quantity
  has_one :user
  has_one :ingredient
end
