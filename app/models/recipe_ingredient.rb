class RecipeIngredient < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :measurement
  belongs_to :recipe

  attr_accessor :how_much, :what

  validates_presence_of :what

  before_save :parse_virtual_attributes

  private

  def parse_virtual_attributes
    if @how_much
	tokens = @how_much.split(/\s+/)

	logger.info tokens[0]
	logger.info tokens[1]

	self.amount = tokens[0]
	self.measurement_id = tokens[1]
	#self.measurement = Measurement.find_by_name(tokens[1])
    end

    self.ingredient = Ingredient.find_or_create_by_name(@what)
  end
end
