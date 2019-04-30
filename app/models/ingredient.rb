class Ingredient < ApplicationRecord
  has_and_belongs_to_many :recipes
  has_many :user_ingredients

  before_save do
    self.name = self.name.downcase
  end
end
