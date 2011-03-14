class MenuIngredient < ActiveRecord::Base
  include Amounted

  belongs_to :menu
  belongs_to :meal
  has_one :grocery, :dependent => :destroy

  before_save :parse_virtual_attributes
  after_find :populate_virtual_attributes
  after_save :copy_to_groceries

  def copy_to_groceries
    grocery = Grocery.new
    grocery.menu_id = self.menu_id
    grocery.menu_ingredient_id = self.id
    grocery.how_much = self.how_much
    grocery.ingredient_name = self.ingredient_name
    grocery.save
    self.grocery = grocery
  end
end
