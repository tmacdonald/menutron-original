module Amounted
  attr_accessor :how_much, :ingredient_name

  # weblog.jamisbuck.org/2007/1/17/concerns-in-activerecord
  # "Because of the included hook, defined in the module, each class that receives this module will automatically gain the associations and validations defined
  def self.included(base)
    base.belongs_to :ingredient
    base.belongs_to :measurement
    
    base.validates_presence_of :ingredient_name
  end

  #private

  def self.convert_amount(amount_string)
    amount = 0.0

    mixed_fraction_regex = /(\d+)\s+(\d+)\s*\/\s*(\d+)/
    fraction_regex = /(\d+)\s*\/\s*(\d+)/
    whole_number_regex = /\d+/

    match = mixed_fraction_regex.match amount_string
    unless match.nil?
      amount = match[1].to_f + (match[2].to_f / match[3].to_f)
      amount_string = ""
    end
  
    match = fraction_regex.match amount_string
    unless match.nil?
      amount = (match[1].to_f / match[2].to_f)
      amount_string = ""
    end

    unless amount_string.empty?
      amount = amount_string.to_f
    end

    amount
  end

  def parse_virtual_attributes

    amount_regex = /(?:\d+\s+\d+\s*\/\s*\d+)|(?:\d+\s*\/\s*\d+)|(?:\d+)/

    if @how_much
      self.amount_format = @how_much
      measurement = Measurement.search(self.amount_format)
      unless measurement.nil? 
        self.amount_format = measurement.replace(self.amount_format)
        self.measurement = measurement
      end
      amount = amount_regex.match(self.amount_format)
      unless amount.nil?
        self.amount = convert_amount(amount[0])
      end
      self.amount_format = self.amount_format.sub(amount_regex, "{a}")
    end

    self.ingredient = Ingredient.find_or_create_by_name(@ingredient_name)
  end
end
