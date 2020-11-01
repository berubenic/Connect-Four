# frozen_string_literal: true

# Player
class Player
  attr_reader :name, :turn
  def initialize
    @name = nil
    @turn = false
  end
end
