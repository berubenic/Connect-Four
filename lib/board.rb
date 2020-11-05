# frozen_string_literal: true

require_relative 'cell'

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
    (0..5).each do |y_coordinate|
      @cells << create_row(y_coordinate)
    end
  end

  def create_row(y_coordinate)
    row = []
    (0..6).each do |x_coordinate|
      row << Cell.new(x_coordinate, y_coordinate)
    end
    row
  end

  def valid_turn?; end

  def place_turn; end
end
