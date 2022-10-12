require_relative 'spec_helper'

describe Book do 
    it "takes three parameters and returns a Book object" do
        @book = Book.new "Title", "Author"
        @book.should be_an_instance_of Book
    end
end