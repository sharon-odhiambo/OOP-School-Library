# frozen_string_literal: true

# This class defines the correct name
class Nameable
  def correct_name
    raise NotImplementedError "#{self.class} has not implemented method '#{__method__}'"
  end
end
