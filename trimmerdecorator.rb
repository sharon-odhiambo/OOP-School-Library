# frozen_string_literal: true

require_relative './basedecorator'

# This class trims the correct name to 10 characters
class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.slice(0..9)
  end
end
