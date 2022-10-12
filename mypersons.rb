require_relative './teacher'
require_relative './student'

class Person
  attr_accessor :age, :name, :specialization, :parent_permission

  def initialize(age, name)
    @age = age
    @name = name
    @id = Random.rand(1..1000)
    @people = if File.size?('./storage/person.json')
                JSON.parse(File.read('./storage/person.json'), object_class: OpenStruct)
              else
                []
              end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    n = gets.chomp.to_i
    create_student unless n == 2
    create_teacher unless n == 1
  end

  def list_people
    if @people.length.positive?
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}\", ID: #{person.id}, Age: #{person.age}"
      end
    else
      puts 'There are no people found'
    end
  end

  private

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.to_s.upcase

    case permission
    when 'N'
      permission = false
    when 'Y'
      permission = true
    else
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.to_s.upcase
    end

    student = Student.new(age, name, permission)
    my_student = { class: 'Student', age: age, name: name, 'Parent Permission': permission, id: @id }
    @people << student
    if File.size?('./storage/person.json')
      file = File.read('./storage/person.json')
      student_list = JSON.parse(file)
      student_list << my_student
      File.write('./storage/person.json', JSON.pretty_generate(student_list))
    else
      File.write('./storage/person.json', JSON.pretty_generate([my_student]), mode: 'a')
    end
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s
    print 'specialization: '
    specialization = gets.chomp.to_s

    teacher = Teacher.new(age, name, specialization)
    my_teacher = { class: 'Teacher', age: age, name: name, specialization: specialization, id: @id }
    @people << teacher
    if File.size?('./storage/person.json')
      file = File.read('./storage/person.json')
      teacher_list = JSON.parse(file)
      teacher_list << my_teacher
      File.write('./storage/person.json', JSON.pretty_generate(teacher_list))
    else
      File.write('./storage/person.json', JSON.pretty_generate([my_teacher]), mode: 'a')
    end
    puts 'Person created successfully'
  end
end
