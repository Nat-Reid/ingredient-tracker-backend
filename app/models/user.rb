class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: {case_sensitive: false}
  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients
end
