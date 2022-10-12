require_relative './basedecorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.upcase
  end
end
