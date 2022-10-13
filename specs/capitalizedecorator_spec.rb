require_relative 'spec_helper'

describe CapitalizeDecorator do
  it 'takes one parameter and returns a CapitalizeDecorator object' do
    @nameable = 'Sharon'
    @capitalizedecorator = CapitalizeDecorator.new(@nameable)
    @capitalizedecorator.should be_an_instance_of CapitalizeDecorator
  end

  it 'takes a string and returns the capitalized version' do
    nameable = 'Sharon'
    capitalizedecorator = CapitalizeDecorator.new(nameable)
    cap = capitalizedecorator.correct_name
    expect(cap).to eq 'SHARON'
  end
end
