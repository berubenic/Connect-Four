# frozen_string_literal: true

# Board
class Board
  def initialize
    @cells = nil
  end

  def prepare_game
    create_board
  end

  def create_board
    @cells = []
  end
end
