class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: {case_sensitive: false}
  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients

  def meals_by_ingredient_expiration_dates
    important_ingredients = self.user_ingredients.where(:expiration_date > DateTime.now).order(:expiration_date).limit(5)
    # hit spoonacular with these ingredients
  end
end
