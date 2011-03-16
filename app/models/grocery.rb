class Grocery < ActiveRecord::Base
  include Amounted
  self.include_root_in_json = false

  belongs_to :menu
  belongs_to :menu_ingredient
  belongs_to :menu_recipe
end
