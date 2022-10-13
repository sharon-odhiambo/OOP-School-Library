require_relative 'spec_helper'

describe Person do
  it 'takes no parameter and returns a person object' do
    @person = Person.new(20, 'name')
    @person.should be_an_instance_of Person
  end
end
