class UserSerializer < ActiveModel::Serializer
  attributes :name, :username, :id
  # has_many :user_ingredient_ids
end
