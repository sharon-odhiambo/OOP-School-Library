class Teacher < Person
  def initialize(specialization, _name = 'unknown')
    super('Mary', 17)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
