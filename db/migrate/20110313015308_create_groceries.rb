class CreateGroceries < ActiveRecord::Migration
  def self.up
    create_table :groceries do |t|
      t.references :menu
      t.references :menu_ingredient
      t.references :menu_recipe
      t.float :amount
      t.references :measurement
      t.references :ingredient
      t.string :measurement_adjectives

      t.timestamps
    end
  end

  def self.down
    drop_table :groceries
  end
end
