require_relative "Employee.rb"
require "byebug"
class Manager < Employee
    def initialize(name,title,salary,boss)
        super
        @employees = []
    end
    attr_accessor :employees

    def bonus(multiplier)    
        sum = self.employees_salary() 
        sum * multiplier
    end

    def employees_salary()
        total_salary = 0
        @employees.each do |employee|
            if employee.is_a?(Manager)
                return employee.employees_salary + employee.salary
            else
                total_salary += employee.salary
            end
        end
        total_salary
    end
end

