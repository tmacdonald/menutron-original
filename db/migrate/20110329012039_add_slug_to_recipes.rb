class AddSlugToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :slug, :string
  end

  def self.down
    remove_column :recipes, :slug
  end
end
