class Teacher < Person
  def initialize(specialization)
    super(age, name)
    @specialization = specialization
  end
end
