class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :email

      t.timestamps
    end

    add_column :menus, :user_id, :integer
  end

  def self.down
    drop_table :users

    remove_column :menus, :user_id
  end
end
