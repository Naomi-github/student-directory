def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  # create an empty array
  students = []
  # get the first  name
  name = gets.chomp
  # while the name is not empty, repeat this code
  until name.empty?
    # add the student to the array
    students << { name: name, cohort: :november }
    puts "Now we have #{students.count} students"
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
  # print each student that starts with the letter N and number each student with
  students.each_with_index do |student, idx|
    if student[:name].chars.first == 'N' && student[:name].length < 12
      puts "#{idx + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
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
