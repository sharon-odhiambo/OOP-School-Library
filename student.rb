class Student < Person
    def initialize(classroom, name = "unknown") 
        super("sharon", 20)
        @classroom = classroom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
end
