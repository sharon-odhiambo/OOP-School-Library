# frozen_string_literal: true

require_relative './book'
require_relative './person'
require_relative './rental'

# This class defines the rentals logics' methods
class Rental
  attr_reader :date

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def initialize(_date, _books, _people)
    @books = if File.size?('./storage/books.json')
               JSON.parse(File.read('./storage/books.json'), object_class: OpenStruct)
             else
               []
             end
    @people = if File.size?('./storage/person.json')
                JSON.parse(File.read('./storage/person.json'), object_class: OpenStruct)
              else
                []
              end
    @rentals = if File.size?('./storage/rental.json')
                 JSON.parse(File.read('./storage/rental.json'), object_class: OpenStruct)
               else
                 []
               end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    puts @rentals
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
    puts person
    my_rental = { 'Date': date, 'title': book.title, 'author': book.author, 'age': person.age, 'name': person.name,
                  'id': person.id }
    @rentals << rental
    if File.size?('./storage/rental.json')
      file = File.read('./storage/rental.json')
      rental_list = JSON.parse(file)
      rental_list << my_rental
      File.write('./storage/rental.json', JSON.pretty_generate(rental_list))
    else
      File.write('./storage/rental.json', JSON.pretty_generate([my_rental]), mode: 'a')
    end
    puts 'Book rented successfully'
  end

  def list_rentals_id
    puts 'Enter person ID: '
    person_id = gets.chomp.to_i
    rentals = @rentals.filter { |rental| rental.id == person_id }
    if @rentals.length.positive?
      rentals.each do |rental|
        puts 'Rentals: '
        puts "Date: #{rental.date}, Book \"#{rental.title}\" by #{rental.author}"
      end
    else
      puts 'No rentals found for this person'
    end
  end

  def list_rentals
    if @rentals.length.positive?
      @rentals.each do |rental|
        puts 'Rentals: '
        puts "Date: #{rental.date}, Book \"#{rental.title}\" by #{rental.author}"
      end
    else
      puts 'No rentals found for this person'
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
end
