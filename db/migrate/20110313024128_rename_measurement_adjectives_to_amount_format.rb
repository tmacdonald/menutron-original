class RenameMeasurementAdjectivesToAmountFormat < ActiveRecord::Migration
  def self.up
    rename_column :recipe_ingredients, :measurement_adjectives, :amount_format
    rename_column :menu_ingredients, :measurement_adjectives, :amount_format
    rename_column :groceries, :measurement_adjectives, :amount_format
  end

  def self.down
    rename_column :recipe_ingredients, :amount_format, :measurement_adjectives
    rename_column :menu_ingredients, :amount_format, :measurement_adjectives
    rename_column :groceries, :amount_format, :measurement_adjectives
  end
end
