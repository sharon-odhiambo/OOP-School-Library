require_relative './basedecorator'
require_relative './capitalizedecorator'
require_relative './trimmerdecorator'
require_relative './classroom.rb'
require_relative './book.rb'
require_relative './rental.rb'

class Person < Nameable
  attr_writer :id
  attr_reader :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end

