@students = [] # an empty array accessible to all methods

def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '3. Save the list to a file'
  puts '4. Load the list from a file'
  puts '9. Exit'
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when '1' then input_students
  when '2' then show_students
  when '3' then save_students
  when '4' then load_students
  when '9' then exit # this will cause the program to terminate
  else
    puts "I don't know what you mean, try again"
  end
end

def input_students
  puts 'Selected 1: successful'
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  # get the first  name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  until name.empty?
    # add the student to the array
    students_data_array(name, :november)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def students_data_array(name, _cohort)
  @students << { name: name, cohort: :november }
end

def show_students
  puts 'Selected 2: successful'
  print_header
  print_student_list
  print_footer
end

def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts 'Selected 3; successful'
  # open the file for writing
  puts 'Please enter the file name'
  filename = gets.chomp
  file = File.open(filename, 'w')
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
end

def load_students
  puts 'Selected 4: successful'
  puts 'please type the file you want to load the students from'
  filename = gets.chomp
  File.open(filename, 'r') do |f|
    f.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      students_data_array(name, cohort)
    end
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given

  if File.exist?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
