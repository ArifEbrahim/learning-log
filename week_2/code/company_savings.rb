#  answer: https://github.com/makersacademy/skills-workshops/blob/master/object_oriented_programming/oop_3/company_structure.rb

class CEO

  def initialize (COO = COO.new)
    @COO = COO
  end


  def make_company_efficient
    @COO(find_company_savings)
  end  
end

class COO

  def initialize (HR = HR.new)
    @HR = HR
  end

  def find_compnay_savings
    sell_old_equipment
    reduce_entertainment_budget
    @HR(reduce_payroll)
  end
  
  def sell_old_equipment
  end

  def reduce_entertainment_budget
  end
end
  
class HR
  def reduce_payroll
    employees.each { |employee| employee.fre if employee.performance < 7 }
  end
end

class Employee
  def initialize
    @performance = rand(1..10)
  end

  def fire
  end
end

employees = []
20.times { employees << Employee.new }