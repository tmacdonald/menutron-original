class CreateMenuRecipes < ActiveRecord::Migration
  def self.up
    create_table :menu_recipes do |t|
      t.references :menu
      t.references :recipe
      t.integer :servings

      t.timestamps
    end
  end

  def self.down
    drop_table :menu_recipes
  end
end
