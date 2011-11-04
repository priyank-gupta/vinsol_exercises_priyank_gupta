## Dont use class_eval within class_eval

module ImportFile
  def import(filename)
    begin
      File.new(filename, 'r')
    rescue
      puts "\nNo such file"
      exit
    end
  end
end

#puts "Enter the filename"
filename = "Persons.csv"
fname = filename.split(/\./)
classname = Class.const_set(fname[0], Class.new)

classname.class_eval do

  extend ImportFile

  def initialize(arr)
    @value = arr

    ### COMMENT  - Why do we need this?
    @inst = self
  end

  def self.create_meth(filename)

    file = import(filename)

    obj = []
    file.each_line("\n") do |row|
      obj << row.chomp.split(/,/)
    end

    methds = obj[0]

    obj.shift

    person = obj.collect {|val| new(val)}

    class_eval do
      methds.each_with_index do |val, index|                     
        define_method(val) do
          @value[index]
        end
      end
    end
    person
  end
end

person = classname.create_meth(filename)
# p person[0].city
# p person[1].name
# p person[2].age
