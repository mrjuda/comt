require_relative './music_album'
require_relative './genre'
require_relative './lib/author'
require 'json'

class Data
  def initialize
    @albums_file = './data/albums.json'
    @genres_file = './data/genres.json'
  end

  def list_albums(albums)
    if albums.length.positive?
      albums.each do |album|
        on_spotify = album.on_spotify == true ? 'YES' : 'NO'
        print "#{album.publish_date} (#{album.author.first_name} #{album.author.last_name}) - On Spotify: #{on_spotify}"
      end
    else
      print 'No albums yet'
    end
  end

  def list_genres(genres)
    if genres.length.positive?
      genres.each do |genre|
        print genre.name
      end
    else
      print 'No genres yet'
    end
  end

  def read_albums
    file = File.open(@albums_file, 'a+')

    return [] unless File.exist?(file)
    return [] if File.zero?(file)

    albums = []
    albums_data = JSON.parse(File.read(file))

    albums_data.each do |album|
      new_genre = Genre.new(album['genre']['name'])
      new_author = Author.new(album['author']['first_name'], album['author']['last_name'])
      album = MusicAlbum.new(album['on_spotify'], album['publish_date'], new_genre, new_author)
      albums.push(album)
    end

    albums
  end

  def read_genres
    genres_file = './data/genres.json'
    file = File.open(genres_file, 'a+')

    return [] unless File.exist?(file)
    return [] if File.zero?(file)

    genres = []
    genres_data = JSON.parse(File.read(file))

    genres_data.each do |genre|
      new_genre = Genre.new(genre['name'])
      genres.push(new_genre)
    end

    genres
  end
  # rubocop:disable all
  def create_new_album
    @albums = []
    puts 'Please enter the publish date (YYYY/MM/DD):'
    publish_date = gets.chomp
    puts 'Is it on Spotify? (true/false)'
    on_spotify = gets.chomp
    puts 'Genre:'
    genre = gets.chomp
    puts 'Author:'
    author = gets.chomp

    new_genre = Genre.new(genre)
    new_author = Author.new(author, author)
    album = MusicAlbum.new(on_spotify, publish_date, new_genre, new_author)

    @albums.push(album)
    write_albums(@albums)
    write_genres(@albums)
    puts 'Album created successfully!'
  end

  def write_genres(albums)
    file = File.open(@genres_file, 'a+')
    File.write(@genres_file, JSON.pretty_generate(make_genre(albums)))
    file.close
  end

  def make_genre(albums)
    items = []
    albums.each { |item| items << create_genre(item) }
    items
  end

  def create_genre(album)
    {
      'name' => album.genre.name
    }
  end

  def write_albums(albums)
    file = File.open(@albums_file, 'a+')
    File.write(file, JSON.pretty_generate(make_album(albums)))
    file.close
  end

  def make_album(albums)
    items = []
    albums.each { |item| items << create_album(item) }
    items
  end

  def create_album(album)
    {
      'publish_date' => album.publish_date, 'on_spotify' => album.on_spotify,
      'genre' => {
        'name' => album.genre.name
      },
      'author' => {
        'first_name' => album.author.first_name,
        'last_name' => album.author.last_name
      }
    }
  end
end

data = Data.new
data.create_new_album
