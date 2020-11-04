# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'cell'

# Game
class Game
  attr_reader :board, :player_one, :player_two

  def initialize(board = Board.new, player_one = Player.new(true), player_two = Player.new(false))
    @board = board
    @player_one = player_one
    @player_two = player_two
  end

  def prepare_game
    board.prepare_game
    player_one.prepare_game
    player_two.prepare_game
  end

  def play_turn(player = current_player)
    player.play_turn
  end

  def current_player
    return player_one if player_one.turn == true
    return player_two if player_two.turn == true
  end
end
