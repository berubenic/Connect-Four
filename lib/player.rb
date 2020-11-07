# frozen_string_literal: true

# Player
class Player
  attr_reader :name, :turn, :color
  def initialize(name = nil, boolean = false, color = nil)
    @name = name
    @turn = boolean
    @color = color
  end

  def prepare_game
    assign_name
  end

  def assign_name
    @name = ask_name
  end

  def ask_name
    puts "What is your name? [#{name}]"
    capture_input
  end

  def play_turn
    move = ask_turn
    move
  end

  def ask_turn
    puts "#{name}, where do you want to play? \n Enter the column number [0-6]"
    capture_input
  end

  def capture_input
    gets.chomp
  end

  def switch_player
    if turn == false
      @turn = true
    elsif turn == true
      @turn = false
    end
  end
end
