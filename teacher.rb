# frozen_string_literal: true

require_relative './person'

# This class defines the Teacher
class Teacher < Person
  def initialize(age, name, specialization)
    super(age, name)
    @specialization = specialization
  end
end
