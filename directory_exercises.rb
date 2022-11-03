def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  # create an empty array
  students = []
  # get the first  name
  name = gets.chomp
  # while the name is not empty, repeat this code
  until name.empty?
    # get the persons hobby
    puts 'What is your hobby?'
    hobby = gets.chomp
    # get the persons country of birth
    puts 'What is your country of birth?'
    country = gets.chomp
    # get the persons age
    puts 'What is your age'
    age = gets.chomp
    # add the student to the array
    students << { name: name, cohort: :november, hobby: hobby, country: country, age: age }
    puts "Now we have #{students.count} students"
    puts "Students #{students}"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort) (hobby:#{student[:hobby]} )(country of birth:#{student[:country]}) (age:#{student[:age]})"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
