#let's put all students into an array
#students = [
#  {name: "Dr. Hannibal Lecter", cohort: :november},
#  {name: "Darth Vader", cohort: :november},
#  {name: "Nurse Ratched", cohort: :november},
#  {name: "Michael Corleone", cohort: :november},
#  {name: "Alex DeLarge", cohort: :november},
#  {name: "The Wicked Witch of the West", cohort: :november},
#  {name: "Terminator", cohort: :november},
#  {name: "Freddie Kruger", cohort: :november},
#  {name: "The Joker", cohort: :november},
#  {name: "Joffrey Baratheon", cohort: :november},
#  {name: "Norman Bates", cohort: :november}
#]
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  default = "November"
  # get the first name
  name = gets.chomp

  name.empty? ? exit : name

  # while the name is not empty, repeat this code
  while !name.empty? do
    # capture further information about each student
    puts "What cohort do you belong to?"
    cohort = gets.delete("\n")
      if cohort.empty?
        puts "The default cohort is #{default}."
        cohort = default
      end

    puts "Please list their hobbies."
      hobbies = gets.delete("\n")
    puts "What is their country of birth?"
      country_of_birth = gets.delete("\n")
    puts "What is their height?"
      height = gets.delete("\n")
    # add the student hash to the array
    students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, country_of_birth: country_of_birth.to_sym, height: height.to_sym}

      if students.count != 1
        puts "Now we have #{students.count} students"
        else
        puts "Now we have 1 student"
      end
    # get another name from the user
    puts "Please add the name of the next student. Leave this entry blank to finish adding students."
    name = gets.chomp
  end
  #return the array of students
  students
end

#def filter_for
#  puts "What is the first letter you would like to filter by?"
#    firstletter = gets.chomp
#end

#def print_using_control_flow(students)
#  count = 1
#  while count <= students.length
#  puts "#{count}: #{students[count-1][:name]} of the #{students[count-1][:cohort]} cohort"
#    count += 1
#  end
#until input.empty?
#    student = input.shift
#    puts "#{student[:name]} of the #{student[:cohort]} cohort"
#  end
#end


def print_header
puts "The students of Villains Academy".center(200)
puts "-------------".center(200)
end


def print_(students)
    students.each_with_index do |student, index|
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort). He is #{student[:height]} tall, was born in #{student[:country_of_birth]}, and has the following hobbies: #{student[:hobbies]})".center(200)
    end
end

#def print_by_group(students)
#  students.map do |x|
#      x[:cohort]
#    end
#  puts students
#end


#def filter_by_input(students, firstletter)
#  students.each_with_index do |student, index|
#    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].start_with?(firstletter)
#  end
#end


#def filter_by_length_12(students)
#  students.each_with_index do |student, index|
#    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < 12
#  end
#end


def print_footer(students)
  if students.count != 1
    puts "Overall, we have #{students.count} great students".center(200)
  else
    puts "Overall, we have #{students.count} great student".center(200)
  end
end
#nothing happens until we call the methods

students = input_students
print_header
print_(students)
print_footer(students)

#print_by_group(students)
#print_using_control_flow(students)
#filter_by_input(students, filter_for)
#filter_by_length_12(students)
