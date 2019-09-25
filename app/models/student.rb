class Student

    @@all = []

    attr_accessor :first_name

    def initialize(first_name)
        @first_name = first_name

        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, instructor, test_name, test_status)
    end

    def self.find_student(name)
        self.all.find do |i|
            i.first_name == name
        end
    end

    def tests 
        BoatingTest.all.select do |i|
            i.student == self
        end
    end

    def passing
        self.tests.select do |i|
            i.status == 'passed'
        end
    end

    def grade_percentage
        self.passing.size >= 1 ? (self.passing.size.to_f / self.tests.size.to_f) * 100 : 0
    end
    
end
