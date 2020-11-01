# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# Game
class Game
  def initialize(board = Board.new, player_one = Player.new, player_two = Player.new)
    @board = board
    @player_one = player_one
    @player_two = player_two
  end

  def prepare_game
    @board.prepare_game
  end
end
