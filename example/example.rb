# frozen_string_literal: true

require './lib/game'

game = Game.new
game.prepare_game
game.display_board

loop do
  game.play_turn
  game.validate_turn
  game.display_board
  return game.announce_winner if game.verify_win?
  return game.announce_tie if game.verify_tie?

  game.switch_player
end
