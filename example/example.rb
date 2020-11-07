require './lib/game'

board = Board.new
board.prepare_game
board.place_turn(0, "\u26AB")
board.print_board

# u26AA
# u26AB
