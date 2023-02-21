require_relative "Employee.rb"
class Manager < Employee
    def initialize(name,title,salary,boss)
        super
        @employees = []
    end
    attr_accessor :employees

    def bonus(multiplier)
        bonus = (@employees.inject(0) {|acc,ele| acc + ele.salary} * multiplier
    end
end

