require_relative './rental.rb'

class Book
    attr_accessor :title, :author
    attr_reader :rentals
    def initialize(title, author)
        @title = title
        @author = author
        @rentals = []
    end

    def add_rentals(rental)
        @rentals = rental
        rental << self
    end
end
