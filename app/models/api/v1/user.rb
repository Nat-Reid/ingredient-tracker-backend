class Api::V1::User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: {case_sensitive: false}
  has_many :user_ingredients, class_name: "Api::V1::UserIngredient", foreign_key: "api_v1_user_id"
end
