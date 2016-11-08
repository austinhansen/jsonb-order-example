class StylePosition
  def initialize(hairstyle_list, style, direction)
    @hairstyle_list = hairstyle_list
    @style = style
    @direction = direction
  end

  def swap_position
    styles = @hairstyle_list.style_attributes
    return styles unless start_position && end_position

    styles_array = styles.to_a
    styles_array[start_position], styles_array[end_position] = styles_array[end_position], styles_array[start_position]
    styles_array.compact.to_h
  end

  private

  def start_position
    @start_position ||= @hairstyle_list.styles.index { |style| style.id == @style.id }
  end

  def end_position
    @end_position ||= case @direction
                      when "up"
                        start_position - 1
                      when "down"
                        start_position + 1
                      end
  end
end
