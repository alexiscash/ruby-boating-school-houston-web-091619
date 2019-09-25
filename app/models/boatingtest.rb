class BoatingTest

    @@all = []

    attr_accessor :student, :instructor, :test_name, :status

    def initialize(student, instructor, test_name, status, add=true)
        @student = student
        @instructor = instructor
        @test_name = test_name
        @status = status
        
        @@all << self if add
    end
    
    def self.all
        @@all
    end

    def add
        @@all << self
    end

end
