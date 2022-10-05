require_relative './basedecorator.rb'
require_relative './capitalizedecorator.rb'
require_relative './trimmerdecorator.rb'

class Person < Nameable
  attr_writer :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
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

person = Person.new(22, 'maximilianus')
p person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
p  capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
p  capitalizedTrimmedPerson.correct_name

