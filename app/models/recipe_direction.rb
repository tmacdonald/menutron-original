class RecipeDirection < ActiveRecord::Base
  default_scope :order => '"order" ASC'
end
