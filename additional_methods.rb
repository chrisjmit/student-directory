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
