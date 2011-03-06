class MenuRecipe < ActiveRecord::Base
	belongs_to :menu
	belongs_to :recipe
end
