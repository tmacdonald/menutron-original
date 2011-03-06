class CreateMenus < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.string :name
      t.string :description, :default => ""

      t.timestamps
    end
  end

  def self.down
    drop_table :menus
  end
end
