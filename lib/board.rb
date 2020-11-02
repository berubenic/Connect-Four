# frozen_string_literal: true

# Board
class Board
  def initialize
    @cells = nil
  end

  def prepare_game
    create_board
  end

  def create_board
    @cells = []
    (0..5).each do |y|
      @cells << create_row(y)
    end
  end

  def create_row(y)
    row = []
    (0..6).each do |x|
      row << Cell.new(x, y)
    end
    row
  end
end
