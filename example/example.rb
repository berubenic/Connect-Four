require './lib/game'

game = Game.new
game.prepare_game
game.display_board

loop do
  game.play_turn
  game.validate_turn
  game.display_board
  return game.announce_winner if game.verify_win?

  game.switch_player
end
