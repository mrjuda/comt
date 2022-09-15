class App
  def initialize
    @games = []
    @authors = []
  end

  def list_authors
    puts "\n*********\nAll Authors"
    puts '---------'
    puts 'No Author to display.' if @authors.length.zero?
    @authors.each do |author|
      puts "Id: #{author.__id__} "
      puts "Author: #{author.first_name} #{author.last_name}\n"
    end
  end

  def list_games
    puts "\n*********\nAll Games"
    puts '---------'
    puts 'No Game to display.' if @games.length.zero?
    @games.each do |game|
      puts "Id: #{game.__id__} "
      puts "Game was published on: #{game.publish_date}"
      puts "Game was last played on: #{game.last_played_at}"
      puts "Multiplayer: #{game.multiplayer}\n"
    end
  end

  def add_game(game)
    @games << game
  end

  def add_author(author)
    @authors << author
  end
end
