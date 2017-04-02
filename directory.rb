@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students details"
  puts "2. Show the students record"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  #puts "3. Use control flow to print"
  #puts "4. Show list of student by their first initial"
  #puts "5. Show students with less than 12 letters in their name"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(user_select)
  case user_select
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again."
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  cohort_default = "November"
  name = STDIN.gets.chomp
    name.empty? ? exit : name
  while !name.empty? do
    puts "What cohort do you belong to?"
      cohort = STDIN.gets.delete("\n")
        if cohort.empty?
          puts "The default cohort is #{cohort_default}."
          cohort = cohort_default
        end

    puts "Please list their hobbies."
      hobbies = STDIN.gets.delete("\n")
    puts "What is their country of birth?"
      country_of_birth = STDIN.gets.delete("\n")
    puts "What is their height?"
      height = STDIN.gets.delete("\n")

    @students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, country_of_birth: country_of_birth.to_sym, height: height.to_sym}

    puts @students.count != 1 ? "Now we have #{@students.count} students" : "Now we have 1 student"

    puts "Please add the name of the next student. Leave this entry blank to finish adding students."
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
puts "The students of Villains Academy".center(100)
puts "-------------".center(100)
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort). He is #{student[:height]} tall, was born in #{student[:country_of_birth]}, and has the following hobbies: #{student[:hobbies]})".center(100)
  end
end

def print_using_control_flow
  count = 1
  while count <= @students.length
  puts "#{count}: #{@students[count-1][:name]} of the #{@students[count-1][:cohort]} cohort"
    count += 1
  end
end

def filter_by_input
  puts "You can list the students by their first initial. What is the first letter you would like to filter by?"
    firstletter = STDIN.gets.chomp
  @students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].start_with?(firstletter)
  end
end

def filter_by_length_12
  @students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < 12
  end
end


def print_footer
  if @students.count != 1
    puts "Overall, we have #{@students.count} great students".center(100)
  else
    puts "Overall, we have #{@students.count} great student".center(100)
  end
end

def save_students
 # open the file for writing
 file = File.open("students.csv", "w")
 # iterate over the array of students
 @students.each do |student|
   student_data = [student[:name], student[:cohort]]
   csv_line = student_data.join(",")
   file.puts csv_line
 end
 file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #get out of the method if it isn't given
  if File.exists?(filename) #if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exists
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
