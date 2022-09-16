module AddFile
  def add_game
    puts "\n*********\nAdding Game"
    puts 'Please enter the following datas'
    puts '---------'

    puts 'First Name:'
    first_name = gets.chomp.to_s
    puts 'Last Name:'
    last_name = gets.chomp.to_s
    author = Author.new(first_name, last_name)
    @app.add_author(author)

    puts "Publish Date 'dd/mm/yyyy':"
    publish_date = gets.chomp.to_s
    puts "Last played 'dd/mm/yyyy':"
    last_played_at = gets.chomp.to_s
    puts 'Multiplayer [true/false]:'
    multiplayer = gets.chomp.to_s
    game = Game.new(publish_date, last_played_at, multiplayer)
    @app.add_game(game)
    game.add_author(author)
    puts "\n\nNew Game Added\n"
  end
end
