require './lib/game'

game = Game.new
game.prepare_game
game.display_board

game.play_turn
game.validate_turn
game.verify_win
game.display_board
