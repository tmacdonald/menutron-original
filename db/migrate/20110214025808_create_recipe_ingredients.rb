class CreateRecipeIngredients < ActiveRecord::Migration
  def self.up
    create_table :recipe_ingredients do |t|
      t.references :ingredient
      t.references :measurement
      t.references :recipe
      t.decimal :amount
      t.string :measurement_adjectives
      t.string :preparation

      t.timestamps
    end
  end

  def self.down
    drop_table :recipe_ingredients
  end
end
