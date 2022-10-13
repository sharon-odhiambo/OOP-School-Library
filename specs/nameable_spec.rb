require_relative 'spec_helper'

describe Nameable do
  it 'returns a string of the added Name' do
    @nameable = Nameable.new
    @nameable.should be_an_instance_of Nameable
  end
end
