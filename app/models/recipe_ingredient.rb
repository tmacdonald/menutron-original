class RecipeIngredient < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :measurement
  belongs_to :recipe

  attr_accessor :how_much, :what

  validates_presence_of :what

  before_save :parse_virtual_attributes

  private

  def parse_virtual_attributes

    amount_regex = /(\d+)|(\d+\s*\/\s*\d+)|(\d+\s+\d+\s*\/\s*\d+)/

    if @how_much
      self.amount_format = @how_much
      measurement = Measurement.search(self.amount_format)
      unless measurement.nil? 
        self.amount_format = measurement.replace(self.amount_format)
      end
      self.amount_format = self.amount_format.sub(amount_regex, "{a}")
    end

    self.ingredient = Ingredient.find_or_create_by_name(@what)
  end
end
