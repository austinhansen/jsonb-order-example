class HairstyleList < ApplicationRecord
  attribute :style_attributes, OrderedJSONB::Type.new

  def styles
    hairstyle_styles.styles
  end

  def styles=(styles_attrs)
    return unless styles_attrs
    self.style_attributes_will_change!
    self.style_attributes = styles_attrs
    hairstyle_styles.styles = styles_attrs
  end

  def find_style(id)
    styles.find { |style| style.id == id }
  end

  private

  def hairstyle_styles
    @styles ||= Hairstyles.new(style_attributes)
  end
end
