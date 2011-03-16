class MenuIngredient < ActiveRecord::Base
  include Amounted

  belongs_to :menu
  belongs_to :meal
  has_one :grocery, :dependent => :destroy

  #before_save :parse_virtual_attributes
  #after_find :populate_virtual_attributes

end
