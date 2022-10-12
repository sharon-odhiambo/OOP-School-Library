require_relative './basedecorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.slice(0..9)
  end
end
