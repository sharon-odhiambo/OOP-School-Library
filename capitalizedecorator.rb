require_relative './basedecorator.rb'

class CapitalizeDecorator < BaseDecorator
    def correct_name
        @nameable.correct_name.upcase
    end
end
