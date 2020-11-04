# frozen_string_literal: true

# Player
class Player
  attr_reader :name, :turn
  def initialize
    @name = nil
    @turn = false
  end

  def prepare_game
    assign_name
  end

  def assign_name
    @name = ask_name
  end

  def ask_name
    puts 'What is your name?'
    capture_name
  end

  def capture_name
    gets.chomp
  end

  def play_turn; end
end
