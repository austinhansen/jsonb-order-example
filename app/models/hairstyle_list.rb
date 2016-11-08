class HairstyleList < ApplicationRecord
  attribute :style_attributes, OrderedJSONB::Type.new

  def styles
    hairstyle_styles.styles
  end

  private

  def hairstyle_styles
    @styles ||= Hairstyles.new(style_attributes)
  end
end
