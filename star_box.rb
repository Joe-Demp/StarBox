# frozen_string_literal: false

# class to create a Plaintext box of stars with a message inside
class StarBox
  STAR = '*'.freeze
  SPACE = ' '.freeze

  def initialize(text = 'Hello World!', width = 63, border = 2)
    @text = text
    @width = width
    @border = border

    check_widths
    calculate_widths

    @stars = icon_printer('*')
    @spaces = icon_printer(' ')
  end

  def to_s
    <<~STARBOX
      #{@stars.call(@width)}
      #{@stars.call(@border)}#{@spaces.call(@lhs)}#{@text}#{@spaces.call(@rhs)}#{@stars.call(@border)}
      #{@stars.call(@width)}
    STARBOX
  end

  private

  def check_widths
    return unless (@border * 2) + @text.length > @width

    raise ArgumentError, 'Arguments do not add up.'
  end

  def calculate_widths
    @box_area = @width - (2 * @border)
    @blank_area = @box_area - @text.length

    @lhs = @blank_area / 2
    @rhs = @lhs + (@blank_area % 2)
  end

  def icon_printer(icon)
    lambda do |num|
      str = ''
      num.times { str << icon }
      str
    end
  end
end
