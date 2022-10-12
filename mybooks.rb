require_relative './book'
require 'json'

class Books
  attr_accessor :title, :author

  # rubocop:enable /CyclomaticComplexity
  def initialize
    @books = if File.size?('./storage/books.json')
               JSON.parse(File.read('./storage/books.json'), object_class: OpenStruct)
             else
               []
             end
  end

  def create_book
    print 'Title: '
    title = gets.chomp.to_s
    print 'Author: '
    author = gets.chomp.to_s

    book = Book.new(title, author)
    my_book = { title: title, author: author }
    @books << book
    if File.size?('./storage/books.json')
      file = File.read('./storage/books.json')
      new_list = JSON.parse(file)
      new_list << my_book
      File.write('./storage/books.json', JSON.pretty_generate(new_list))
    else
      File.write('./storage/books.json', JSON.pretty_generate([my_book]), mode: 'a')
    end
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
