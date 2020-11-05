# frozen_string_literal: true

# Cell
class Cell
  attr_reader :coordinate, :content
  def initialize(x, y, content = nil)
    @coordinate = [x, y]
    @content = content
  end

  def cell_empty?
    content.nil?
  end
end
