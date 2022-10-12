require_relative './nameable'
require 'pry'

class BaseDecorator < Nameable
  attr_accessor :nameable, :correct_name

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable
  end
end

