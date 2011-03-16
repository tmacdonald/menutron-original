module Amounted
  attr_accessor :how_much

  def ingredient_name
    self.ingredient.name
  end

  def ingredient_name=(name)
    self.ingredient = Ingredient.find_or_create_by_name(name)
  end

  def how_much
    measurement_name = self.measurement.name unless self.measurement.nil?
    [Amounted.format_amount(self.amount), measurement_name].join(" ")
  end

  def how_much=(value)
    
    amount_regex = /(?:\d+\s+\d+\s*\/\s*\d+)|(?:\d+\s*\/\s*\d+)|(?:\d+)/

      self.amount_format = value
      measurement = Measurement.search(self.amount_format)
      unless measurement.nil? 
        self.amount_format = measurement.replace(self.amount_format)
        self.measurement = measurement
      end
      amount = amount_regex.match(self.amount_format)
      unless amount.nil?
        self.amount = Amounted.convert_amount(amount[0])
      end
      self.amount_format = self.amount_format.sub(amount_regex, "{a}")
  end

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

  def self.format_amount(amount)
    if amount.nil?
      ""
    else
      fraction = amount.fraction
  
      if fraction[1] == 1
        fraction[0].to_s
      else
   
        whole = ""
        if amount.to_i > 0
          whole = amount.to_i.to_s
          fraction[0] = fraction[0] - (amount.to_i * fraction[1])
        end
    

        (whole << " " << fraction[0].to_s << "/" << fraction[1].to_s).strip
      end
    end
  end

  def populate_virtual_attributes
    formatted_amount = Amounted.format_amount(self.amount)
    measurement_name = self.measurement.name unless self.measurement.nil?
    #@ingredient_name = self.ingredient.name unless self.ingredient.nil?

    logger.debug measurement_name

    unless self.amount.nil?
      if measurement_name.nil?
        @ingredient_name = @ingredient_name.pluralize if self.amount == 0 or self.amount > 1
      else
        measurement_name = measurement_name.pluralize if self.amount == 0 or self.amount > 1
      end
    end

    @how_much = formatted_amount
    unless measurement_name.nil?
      @how_much << " " << measurement_name
    end
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
        self.amount = Amounted.convert_amount(amount[0])
      end
      self.amount_format = self.amount_format.sub(amount_regex, "{a}")
    end

    #self.ingredient = Ingredient.find_or_create_by_name(@ingredient_name)
  end
end
