# frozen_string_literal: true

require_relative './rental'

# This class defines the Book
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rentals(rental)
    @rentals << rental
    rental.book = self
  end
end
