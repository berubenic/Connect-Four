# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'cell'

# Game
class Game
  attr_reader :board, :player_one, :player_two, :move

  def initialize(board = Board.new, player_one = Player.new(true), player_two = Player.new(false))
    @board = board
    @player_one = player_one
    @player_two = player_two
    @move = nil
  end

  def prepare_game
    board.prepare_game
    player_one.prepare_game
    player_two.prepare_game
  end

  def play_turn(player = current_player)
    @move = player.play_turn
  end

  def current_player
    return player_one if player_one.turn == true
    return player_two if player_two.turn == true
  end

  def validate_turn
    if board.valid_turn?
      board.place_turn
    else
      play_turn
    end
  end
end
