# frozen_string_literal: true

require_relative 'cell'
require 'pry'

# Board
class Board
  attr_reader :cells

  def initialize(cells = nil)
    @cells = cells
  end

  def prepare_game
    create_board
  end

  def valid_turn?(move)
    valid_number?(move) && column_not_full?(move)
  end

  def place_turn(move, color)
    columns = cells.transpose
    column_being_played = columns[move.to_i]
    column_from_bottom = column_being_played.reverse
    find_empty_cell(column_from_bottom, color)
  end

  def verify_win?
    row? || column? || right_diagonal? || left_diagonal?
  end

  def display_board
    print_board
  end

  private

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

  def find_empty_cell(column, color)
    column.each do |cell|
      return cell.update_content(color) if cell.content.nil?
    end
  end

  def top_row_content
    cells[0].map(&:content)
  end

  def row?
    four_in_a_row(cells)
  end

  def four_in_a_row(arr)
    arr.each do |row|
      a = row.each_cons(4).find { |a| a.uniq(&:content).size == 1 && !a.first.content.nil? }
      return true unless a.nil?
    end
    false
  end

  def column?
    arr = cells.transpose
    four_in_a_row(arr)
  end

  def right_diagonal?
    arr = keep_length_of_at_least_four(right_diagonals)
    four_in_a_row(arr)
  end

  def left_diagonal?
    arr = keep_length_of_at_least_four(left_diagonals)
    four_in_a_row(arr)
  end

  def right_diagonals
    arr = cells
    padding = [*0..(arr.length - 1)].map { |i| [nil] * i }
    padded = padding.reverse.zip(arr).zip(padding).map(&:flatten)
    padded.transpose.map(&:compact)
  end

  def left_diagonals
    arr = cells
    padding = [*0..(arr.length - 1)].map { |i| [nil] * i }
    padded = padding.zip(arr).zip(padding.reverse).map(&:flatten)
    padded.transpose.map(&:compact)
  end

  def keep_length_of_at_least_four(arr)
    arr.filter_map { |a| a if a.length >= 4 }
  end

  def display_content(cell)
    if cell.content.nil?
      '  '
    else
      cell.content
    end
  end

  def print_board
    puts ' 0  1  2  3  4  5  6'
    puts '  - - - - - - - - - - - - - - - - '
    cells.each do |row|
      row.each { |cell| print "| #{display_content(cell)} " }
      print '|'
      puts "\n"
      puts '  - - - - - - - - - - - - - - - - '
    end
  end
end
