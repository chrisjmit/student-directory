require 'csv'
@students = []

def print_menu
  puts "1. Input the students details"
  puts "2. Show the students record"
  puts "3. Save the list"
  puts "4. Load the list"
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
  name = STDIN.gets.chomp
    name.empty? ? interactive_menu : name
  puts "What cohort do you belong to?"
    cohort_default = "November"
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

  while !name.empty? do
    append_student(name, cohort, hobbies, country_of_birth, height)
  puts @students.count != 1 ? "Now we have #{@students.count} students" : "Now we have 1 student"
  puts "Please add the name of the next student. Leave this entry blank to finish adding students."
    input_students
  end
end

def append_student(name, cohort, hobbies, country_of_birth, height)
  @students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, country_of_birth: country_of_birth, height: height}
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

def print_footer
  if @students.count != 1
    puts "Overall, we have #{@students.count} great students".center(100)
  else
    puts "Overall, we have #{@students.count} great student".center(100)
  end
end

def save_students
 puts "Which file would you like to save the records to? Leave blank for students.csv"
 save_file = STDIN.gets.chomp; save_file = "students.csv" if save_file == ""
 CSV.open(save_file, "w") do |csv|
   @students.each do |student|
     student_data = [student[:name], student[:cohort], student[:hobbies], student[:country_of_birth],student[:height]]
     csv << student_data
   end
 end
 puts "Student data saved to #{save_file}."
end

def load_students(filename = "students.csv")
  puts "Which user file would you lke to load? Leave blank for students.csv"
  userfile = STDIN.gets.chomp
  userfile.empty? ? userfile = "students.csv" : userfile
  CSV.foreach(userfile, "r") do |student|
    name, cohort, hobbies, country_of_birth, height = student
    @students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, country_of_birth: country_of_birth, height: height}
  end
  puts "Data loaded from #{userfile}."
end

def try_load_students
  filename = ARGV.first
     load_students("students.csv")
   elsif File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
   else puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
