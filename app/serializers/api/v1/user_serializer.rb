class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :username, :name
end
