class CreateMenuIngredients < ActiveRecord::Migration
  def self.up
    create_table :menu_ingredients do |t|
      t.references :ingredient
      t.references :measurement
      t.references :menu
      t.references :meal
      t.decimal :amount
      t.string :measurement_adjectives
      t.string :preparation

      t.timestamps
    end
  end

  def self.down
    drop_table :menu_ingredients
  end
end
