class CreateMeasurements < ActiveRecord::Migration
  def self.up
    create_table :measurements do |t|
      t.string :name
      t.string :regex

      t.timestamps
    end
  end

  def self.down
    drop_table :measurements
  end
end
