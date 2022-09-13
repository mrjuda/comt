def main
  puts 'Choose an option: '
  puts '[1] List Items'
  puts '[2] Add an Item'
  puts '[3] Exit'
  option = gets.chomp.to_i
  options(option)
end

def options(option)
  case option
  when 1
    list_option
  when 2
    add_option
  end
end

def add_option
  puts '[1] Add a book'
  puts '[2] Add a music album'
  puts '[3] Add a movie'
  puts '[4] Add a game'
  puts '[5] Exit'
end

def list_option
  puts '[1] List all books'
  puts '[2] List all music albums'
  puts '[3] List all movies'
  puts '[4] List of games'
  puts '[5] List all genres'
  puts '[7] List all labels'
  puts '[8] List all authors'
  puts '[9] List all sources'
  puts '[10] Exit'
end
