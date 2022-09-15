require 'json'

module FileUpdate
  def write_json
    File.write('data/author.json', '', mode: 'w')
    File.write('data/game.json', '', mode: 'w')

    @app.games.each do |game|
      json_game = JSON.generate(game)
      File.write('data/game.json', "#{json_game}\n", mode: 'a')
    end

    @app.authors.each do |author|
      json_author = JSON.generate(author)
      File.write('data/author.json', "#{json_author}\n", mode: 'a')
    end

  def reader_authors
    unless File.exist?('data/author.json')
      File.open('data/author.json', 'w')
      return []
    end
    authors = []
    File.foreach('data/author.json') do |line|
      authors << JSON.parse(line, create_additions: true)
    end
    authors
  end

  def reader_games
    unless File.exist?('data/game.json')
      File.open('data/game.json', 'w')
      return []
    end
    games = []
    File.foreach('data/game.json') do |line|
      games << JSON.parse(line, create_additions: true)
    end
    games
  end
end
