class RecipeIngredient < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :measurement
  belongs_to :recipe

  def how_much
  end

  def how_much=(value)
  end

  def what
  end

  def what=(value)
  end
end
