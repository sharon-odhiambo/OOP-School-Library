# frozen_string_literal: true

require_relative './basedecorator'

# This class capitalizes the user's name
class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.upcase
  end
end
