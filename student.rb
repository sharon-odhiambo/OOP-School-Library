require_relative './classroom.rb'

class Student < Person
  attr_reader :classroom
  def initialize(classroom)
    super(23, "Unknown")
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
