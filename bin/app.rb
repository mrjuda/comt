require_relative '../store'
require_relative '../attributes'
require_relative '../lib/label'
require_relative '../lib/create_book'
require_relative '../lib/book'
require_relative '../lib/item'
require_relative '../lib/music_functions'
require 'json'

class App
  include Store
  include Attributes

  def initialize
    @games = []
    @authors = []
    @books = load_books
    @labels = load_labels
    @music = MusicData.new
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

  def list_all_books
    puts(@books.map { |book| puts "Publisher: #{book[:publisher]}. Cover State: #{book[:cover_state]}" })
  end

  def list_all_labels
    labels = load_labels
    labels.each_with_index do |label, index|
      puts "[#{index}] [Label: #{label[:label]} Cover state: #{label[:cover_state]} Publisher: #{label[:publisher]}]"
    end
  end

  def load_labels
    file = File.open('./data/labels.json')
    file_data = file.read
    if file_data == ''
      @labels = []
    else
      convert_to_array = JSON.parse(file_data, symbolize_names: true)
      @labels = convert_to_array
    end
  end

  def add_game(game)
    @games << game
  end

  def add_author(author)
    @authors << author
  end

  def add_item
    puts 'When was this item published? (Format yyyy/mm/dd)'
    publish_date = gets.chomp
    puts 'Label:'
    label = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp.to_s
    print 'Cover State: '
    cover_state = gets.chomp.to_s
    puts 'Book created successfully!'
    new_book = Book.new(publish_date, publisher, cover_state, label)
    @books << new_book.book_to_hash
    store_books(@books.to_json)
  end

  def list_music_albums
    albums = @music.read_albums
    @music.list_albums(albums)
  end

  def list_all_genres
    genres = @music.read_genres
    @music.list_genres(genres)
  end

  def add_music
    @music.create_new_album
  end
end
