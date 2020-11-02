# frozen_string_literal: true

# Cell
class Cell
  def initialize(x, y, content = nil)
    @coordinate = [x, y]
    @content = content
  end
end
