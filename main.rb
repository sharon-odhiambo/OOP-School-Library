require_relative './books'
require_relative './persons'
require_relative './rentals'

class Main
  attr_accessor :title, :author, :name, :age
  attr_reader :date

  def initialize
    @books = Books.new
    @people = Person.new(age, name)
    @rentals = Rental.new(date, @books, @people)
  end

  def library_options
    print "Welcome to the School Library App!\n"
    @options = 0
    while @options != 7
      print "\nPlease choose an option by entering a number: \n"
      print "1 - list all books\n"
      print "2 - list all people\n"
      print "3 - create a person\n"
      print "4 - create a book\n"
      print "5 - create a rental\n"
      print "6 - list all rentals for a given person id\n"
      print "7 - exit\n"
      run_app
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def run_app
    option = gets.chomp.to_i
    case option
    when 1
      @books.list_books
    when 2
      @people.list_people
    when 3
      @people.create_person
    when 4
      @books.create_book
    when 5
      @rentals.create_rental
    when 6
      @rentals.list_rentals
    when 7
      exit_app
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  private

  def exit_app
    puts 'Thank you for using this app'
    exit!
  end
end

options = Main.new
options.library_options
options.run_app
