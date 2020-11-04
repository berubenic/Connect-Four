# frozen_string_literal: true

# Player
class Player
  attr_reader :name, :turn
  def initialize(boolean = false)
    @name = nil
    @turn = boolean
  end

  def prepare_game
    assign_name
  end

  def assign_name
    @name = ask_name
  end

  def ask_name
    puts 'What is your name?'
    capture_input
  end

  def play_turn
    move = ask_turn
    move
  end

  def ask_turn
    puts "Where do you want to play? \n Enter the column number [0-6]"
    capture_input
  end

  def capture_input
    gets.chomp
  end
end
