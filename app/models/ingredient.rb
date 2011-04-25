class Ingredient < ActiveRecord::Base
  validates_presence_of :name

  paginates_per 10
end
