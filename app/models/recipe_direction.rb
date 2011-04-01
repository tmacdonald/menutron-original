class RecipeDirection < ActiveRecord::Base
  default_scope :order => '"order" ASC'

  belongs_to :recipe
end
