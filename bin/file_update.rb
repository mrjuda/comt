require 'json'

module FileUpdate
  def initialize
    @author_file = 'data/author.json'
    @game_file = 'data/game.json'
  end

  def write_json
    File.write(@author_file, '', mode: 'w')
    File.write(@game_file, '', mode: 'w')

    @app.games.each do |game|
      json_game = JSON.generate(game)
      File.write(@game_file, "#{json_game}\n", mode: 'a')
    end

    @app.authors.each do |author|
      json_author = JSON.generate(author)
      File.write(@author_file, "#{json_author}\n", mode: 'a')
    end
  end

  def reader_authors
    unless File.exist?(@author_file)
      File.open(@author_file, 'w')
      return []
    end
    authors = []
    File.foreach(@author_file) do |line|
      authors << JSON.parse(line, create_additions: true)
    end
    authors
  end

  def reader_games
    unless File.exist?(@game_file)
      File.open(@game_file, 'w')
      return []
    end
    games = []
    File.foreach(@game_file) do |line|
      games << JSON.parse(line, create_additions: true)
    end
    games
  end
end
