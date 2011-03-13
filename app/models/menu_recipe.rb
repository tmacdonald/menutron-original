class MenuRecipe < ActiveRecord::Base
  belongs_to :menu
  belongs_to :recipe
  has_many :groceries
end
