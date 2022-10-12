# frozen_string_literal: true

require_relative './person'
require_relative 'book'

# This class defines the Rentals
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end
end
