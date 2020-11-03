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
    @name = input_name
  end

  def input_name
    puts 'What is your name?'
    gets.chomp
  end
end
