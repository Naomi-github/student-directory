# In the input_students method the cohort value is hard-coded. How can you ask for both the name and the cohort? What if one of the values is empty? Can you supply a default value? The input will be given to you as a string? How will you convert it to a symbol? What if the user makes a typo?

def input_students
  months = %i[ january february march april may june july august september october november
               december ]
  puts 'Please enter the name of the student'
  puts 'To finish, just hit return twice'
  # create an empty array
  students = []
  # get the first  name and cohort
  name = gets.chomp

  until months.include?(cohort_input)
    puts 'Which cohort?'
    cohort_input = gets.chomp
    cohort_input = :november if cohort_input.empty?
  end
  # while the name is not empty, repeat this code
  until name.empty?
    # add the student to the array
    students << { name: name, cohort: cohort_input }
    puts "Now we have #{students.count} students"
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
    students << { name: name, cohort: cohort_input.to_sym, hobby: hobby, country: country, age: age }
    puts "Now we have #{students.count} students".center(100)
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts 'The students of Villains Academy'.center(100)
  puts '-------------'.center(100)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort) (hobby:#{student[:hobby]} )(country of birth:#{student[:country]}) (age:#{student[:age]})".center(100)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(100)
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
