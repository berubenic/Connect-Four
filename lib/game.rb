# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'cell'
require_relative 'monkey_patch/string'

# Game
class Game
  attr_reader :board, :player_one, :player_two, :move

  def initialize(board = Board.new, player_one = Player.new('player_one', true, "\u26AA"), player_two = Player.new('player_two', false, "\u26AB"))
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
    if board.valid_turn?(move)
      board.place_turn(move, current_player.color)
    else
      play_turn
    end
  end

  def verify_win?
    board.verify_win?
  end

  def switch_player
    player_one.switch_player
    player_two.switch_player
  end

  def display_board
    board.display_board
  end

  def announce_winner
    puts "#{current_player.name} wins!"
  end
end
