require_relative 'spec_helper'

describe Books do 
    it "takes no parameter and returns a Book object" do
        @book = Books.new
        @book.should be_an_instance_of Books
    end
end