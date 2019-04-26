class UserSerializer < ActiveModel::Serializer
  attributes :name, :username
  has_many :user_ingredients
end
