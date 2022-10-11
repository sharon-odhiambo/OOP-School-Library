require_relative './books'
require_relative './persons'
require_relative './rental'

class Rental
  attr_reader :date

  def initialize(_date, _books, _people)
    @books = []
    @people = []
    @rentals = []
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    selected_book = gets.chomp.to_i
    book = @books[selected_book]

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
    end
    selected_person = gets.chomp.to_i
    person = @people[selected_person]
    date = Time.now.strftime('%Y/%m/%d')
    puts "Date: #{date}"
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts 'Book rented successfully'
  end

  def list_rentals
    puts 'Enter person ID: '
    person_id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == person_id }
    if @rentals.length.positive?
      rentals.each do |rental|
        puts 'Rentals: '
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    else
      puts 'No rentals found for this person'
    end
  end
end
