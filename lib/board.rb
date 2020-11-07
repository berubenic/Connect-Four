# frozen_string_literal: true

require_relative 'cell'

# Board
class Board
  attr_reader :cells

  def initialize(cells = nil)
    @cells = cells
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

  def valid_turn?(move)
    valid_number?(move) && column_not_full?(move)
  end

  def valid_number?(move)
    move = move.to_i
    return true if move >= 0 && move <= 6

    invalid_number_message
    false
  end

  def invalid_number_message
    puts 'Invalid move, must be a number between 0 and 6'
  end

  def column_not_full?(move)
    content = top_row_content
    content[move.to_i].nil?
  end

  def top_row_content
    cells[0].map(&:content)
  end

  def place_turn(move, color)
    columns = cells.transpose
    column_being_played = columns[move.to_i]
    column_from_bottom = column_being_played.reverse
    find_empty_cell(column_from_bottom, color)
  end

  def find_empty_cell(column, color)
    column.each do |cell|
      return cell.update_content(color) if cell.content.nil?
    end
  end

  def verify_win
    diagonals
  end

  def diagonals
    left_diagonals
  end

  def left_diagonals
    arr = set_left_diagonals
    keep_length_of_four(arr)
  end

  def set_left_diagonals
    arr = cells
    padding = [*0..(arr.length - 1)].map { |i| [nil] * i }
    padded = padding.reverse.zip(arr).zip(padding).map(&:flatten)
    padded.transpose.map(&:compact)
  end

  def keep_length_of_at_least_four(arr)
    arr.filter_map { |a| a if a.length >= 4 }
  end
end
