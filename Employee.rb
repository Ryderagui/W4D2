class Employee

    def initialize(name,title,salary,boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end
    attr_reader :name,:title,:salary
    
    def bonus(multiplier)
        bonus = self.salary * multiplier
    end

end