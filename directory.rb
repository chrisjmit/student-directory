#let's put all students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddie Kruger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
#and then print them
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end
#finally we print the total
print "Overall, we have #{students.count} great students"
