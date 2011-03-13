class ChangeDecimalsToFloats < ActiveRecord::Migration
  def self.up
    change_column :recipe_ingredients, :amount, :float
    change_column :menu_ingredients, :amount, :float
    change_column :groceries, :amount, :float
  end

  def self.down
    change_column :recipe_ingredients, :amount, :decimal
    change_column :menu_ingredients, :amount, :decimal
    change_column :groceries, :amount, :decimal
  end
end
