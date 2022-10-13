require_relative 'spec_helper'

describe Rental do
  it 'takes three parameters and returns a Rental object' do
    @book = { title: 'Title', author: 'Author' }
    @person = { age: 'Age', name: 'Name' }
    @rental = Rental.new '2020-10-12', @book, @person
    @rental.should be_an_instance_of Rental
  end
end
