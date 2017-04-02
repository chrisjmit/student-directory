def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students details"
    puts "2. Show the students record"
    puts "9. Exit" #9 because we'll be adding more items
    # 2. read the input and save it into a variable
    user_select = gets.chomp
    # 3. do what the user has asked
    case user_select
    when "1"
      # input the students
      students = input_students
    when "2"
      # show the students
      print_header
      print_(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
    # 4. repeat from step 1
      puts "I don't know what you meant, try again."
    end
  end
end



def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
    # create an empty array
  students = []
  default = "November"
    # get the first name
  name = gets.chomp
    name.empty? ? exit : name
    students.count != 1 ? "Now we have #{students.count} students" : "Now we have 1 student"

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

    puts students.count != 1 ? "Now we have #{students.count} students" : "Now we have 1 student"

    # get another name from the user
    puts "Please add the name of the next student. Leave this entry blank to finish adding students."
    name = gets.chomp
  end
  #return the array of students
  students
end


def print_using_control_flow(students)
  count = 1
  while count <= students.length
  puts "#{count}: #{students[count-1][:name]} of the #{students[count-1][:cohort]} cohort"
    count += 1
  end
end


def print_header
puts "The students of Villains Academy".center(100)
puts "-------------".center(100)
end


def print_(students)
    students.each_with_index do |student, index|
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort). He is #{student[:height]} tall, was born in #{student[:country_of_birth]}, and has the following hobbies: #{student[:hobbies]})".center(100)
    end
end

#def print_by_group(students)
#  students.map do |x|
#      x[:cohort]
#    end
#  puts students
#end


def filter_by_input(students)
  puts "You can list the students by their first initial. What is the first letter you would like to filter by?"
    firstletter = gets.chomp
  students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].start_with?(firstletter)
  end
end


def filter_by_length_12(students)
  students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < 12
  end
end


def print_footer(students)
  if students.count != 1
    puts "Overall, we have #{students.count} great students".center(100)
  else
    puts "Overall, we have #{students.count} great student".center(100)
  end
end
#nothing happens until we call the methods

interactive_menu
#print_header
#print_(students)
#filter_by_input(students)
#filter_by_length_12(students)
#print_using_control_flow(students)
#print_by_group(students)
#print_footer(students)
