class Measurement < ActiveRecord::Base
  validates_presence_of :name, :regex

  def self.search(input)
    result = nil
    measurements = Measurement.all
    measurements.each do |measurement|
      regex = Regexp.new(measurement.regex)
      result = measurement if regex.match(input) != nil
    end
    result 
  end
end
