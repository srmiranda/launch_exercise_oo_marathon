class Zoo
  attr_reader :name, :cages, :employees
  def initialize(name)
    @name = name
    @cages = []
    create_cages
    @employees = []
  end

  def create_cages
    10.times do |cage|
      cage = Cage.new
      cages << cage
    end
  end

  def add_employee(new_employee)
    employees << new_employee
  end

  def add_animal(new_animal)
    raise ZooAtCapacity unless cages.last.empty?
    cages.each do |cage|
      if cage.empty?
        cage.animal = new_animal
        break
      end
    end
  end

  def visit
    greeting = ""
    employees.each do |employee|
      greeting += "#{employee.greet}\n"
    end
    cages.each do |cage|
      unless cage.empty?
        greeting += "#{cage.animal.speak}\n"
      end
    end
    greeting
  end
end

class ZooAtCapacity < StandardError
end
