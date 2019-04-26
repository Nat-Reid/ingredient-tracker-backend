class CreateUserIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :user_ingredients do |t|
      t.references :user
      t.references :ingredient
      t.date :expiration_date
      t.string :quantity

      t.timestamps
    end
  end
end
