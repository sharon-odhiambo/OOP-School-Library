require_relative './teacher'
require_relative './student'

class Person
  attr_accessor :age, :name, :specialization, :parent_permission
   
  def initialize(age, name)
    @age = age
    @name = name
    @people = []
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
        @people << student
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
        @people << teacher
        puts 'Person created successfully'
      end
  end