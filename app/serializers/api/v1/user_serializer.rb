class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :password_digest
end
