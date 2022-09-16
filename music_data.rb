require 'json'
require_relative './music_album'
require_relative '.genre'

# music data
class Data
  def initialize
    @albums = './data/albums.json'
    @genres = './data/genres.json'
  end

  def read_albums
    file = File.open(@albums, 'a+')

    return [] unless File.exist?(file)
    return [] if File.zero?(file)

    albums = []
    albums_data = JSON.parse(File.read(file))

    albums_data.each do |album|
      albums.push(MusicAlbum.new(album['publish_date'], album['on_spotify'], album['id']))
    end

    albums
  end

  def write_albums(albums)
    albums_data = []
    albums.each do |album|
      albums_data.push({
                         publish_date: album.publish_date,
                         on_spotify: album.on_spotify,
                         id: album.id
                       })
    end
    File.write(@albums, albums_data.to_json)
  end

  def write_genres(genres)
    genres_data = []
    genres.each do |genre|
      genres_data.push({
                         name: genre.name,
                         id: genre.id
                       })
    end
    File.write(@genres, genres_data.to_json)
  end

  def read_genres
    file = File.open(@genres, 'a+')

    return [] unless File.exist?(file)
    return [] if File.zero?(file)

    genres = []
    genres_data = JSON.parse(File.read(file))

    genres_data.each do |genre|
      new_genre = Genre.new(genre['name'], genre['id'])
      genres.push(new_genre)
    end

    genres
  end
end
