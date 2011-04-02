class AddOrder < ActiveRecord::Migration
  def self.up
    add_column :recipe_ingredients, :order, :integer
  end

  def self.down
    remove_column :recipe_ingredients, :order
  end
end
