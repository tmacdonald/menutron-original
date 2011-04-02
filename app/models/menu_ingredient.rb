class MenuIngredient < ActiveRecord::Base
  include Amounted

  belongs_to :menu
  belongs_to :meal
  has_one :grocery, :dependent => :destroy
end
