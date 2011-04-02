class ChangePluralForIngredients < ActiveRecord::Migration
  def self.up
    remove_column :ingredients, :plural
    add_column :ingredients, :plural, :boolean, :default => false
  end

  def self.down
    remove_column :ingredients, :plural
    add_column :ingredients, :plural, :boolean
  end
end
