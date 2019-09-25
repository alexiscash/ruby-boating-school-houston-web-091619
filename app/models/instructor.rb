class Instructor

    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        
        @@all = self
    end

    def self.all
        @@all
    end

    def tests
        BoatingTest.all.select do |i|
            i.instructor == self
        end
    end

    def students
        self.tests.map(&:student)
    end

    def pass_student(student, test_name)
        found = BoatingTest.all.find do |i|
            i.student == student && i.test_name == test_name
        end
        found ? found.status = 'passed' : BoatingTest.new(student, self, test_name, 'passed')
    end

    def fail_student(student, test_name)
        found = BoatingTest.all.find do |i|
            i.student == student && i.test_name == test_name
        end
        found ? found.status = 'failed' : BoatingTest.new(student, self, test_name, 'failed')
    end    

end
