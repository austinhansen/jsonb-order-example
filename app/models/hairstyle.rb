class Hairstyle
  include Attrio

  define_attributes do
    attr :colour, String
    attr :part, String
    attr :style, String
    attr :length, String
    attr :id, String
  end

  def initialize(params = {})
    self.attributes = params
  end

  def attributes=(attributes = {})
    attributes.each do |attr, value|
      send("#{attr}=", value) if respond_to?("#{attr}=")
    end
  end
end
