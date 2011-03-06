class CreateMeals < ActiveRecord::Migration
  def self.up
    create_table :meals do |t|
      t.string :name
      t.references :menu

      t.timestamps
    end
    change_table :menu_recipes do |t|
      t.references :meal
    end
  end

  def self.down
    drop_table :meals
    change_table :menu_recipes do |t|
      t.remove :meal_id
    end
  end
end
