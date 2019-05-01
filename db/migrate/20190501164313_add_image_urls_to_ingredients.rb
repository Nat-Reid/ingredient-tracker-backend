class AddImageUrlsToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :image_url, :string
  end
end
