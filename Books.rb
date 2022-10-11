require_relative './book'

class Books
  attr_accessor :title, :author
    
  def initialize
    @books = []
  end

    def create_book
        print 'Title: '
        title = gets.chomp.to_s
        print 'Author: '
        author = gets.chomp.to_s
    
        book = Book.new(title, author)
        @books << book
        puts 'Book created successfully'
      end
    
      def list_books
        if @books.length.positive?
          @books.each do |book|
            puts "Title: '#{book.title}', Author: #{book.author}"
          end
        else
          puts 'There are no books found'
        end
      end
end