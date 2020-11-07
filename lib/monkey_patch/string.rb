# frozen_string_literal: true

# check if string is a number
class String
  def numeric?
    !Float(self).nil?
  rescue StandardError
    false
  end
end
