class Hairstyles
  attr_reader :styles

  def initialize(hairstyles_attrs)
    @hairstyles_attrs = hairstyles_attrs
  end

  def styles
    @styles ||= @hairstyles_attrs.map do |id, style_params|
      style_params[:id] = id
      Hairstyle.new(style_params.with_indifferent_access)
    end
  end

  def styles=(styles_attrs)
    @styles = styles_attrs.map do |id, style_params|
      style_params[:id] = id
      Hairstyle.new(style_params.with_indifferent_access)
    end
  end
end
