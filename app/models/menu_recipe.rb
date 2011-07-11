class MenuRecipe < ActiveRecord::Base
  belongs_to :menu
  belongs_to :recipe
  has_many :groceries

  def as_json(options = nil)
    super( { :include => :recipe } )
  end
end
