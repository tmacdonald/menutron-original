class CreateRecipeDirections < ActiveRecord::Migration
  def self.up
    create_table :recipe_directions do |t|
      t.text :text
      t.integer :order
      t.references :recipe

      t.timestamps
    end
  end

  def self.down
    drop_table :recipe_directions
  end
end
