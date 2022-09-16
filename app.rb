# app.rb
def list_albums(albums)
  if albums.length.positive?
    albums.each do |album|
      on_spotify = album.on_spotify == 'Y' ? 'YES' : 'NO'
      print "#{album.name} (#{album.author.first_name} #{album.author.last_name}) - Spotify: #{on_spotify}"
    end
  else
    print 'No albums yet'
  end
end

def list_genres(genres)
  if genres.length.positive?
    genres.each do |genre|
      print "#{genre.name}"
    end
  else
    print 'No genres yet'
  end
end

# rubocop:disable Metrics/MethodLength
def create_album
  puts 'Please enter the publish date (YYYY/MM/DD):'
  publish_date = gets.chomp
  puts 'Is it on Spotify? (true/false)'
  on_spotify = gets.chomp
  puts 'Title:'
  title = gets.chomp
  puts 'Genre:'
  genre = gets.chomp
  puts 'Author:'
  author = gets.chomp

  album = MusicAlbum.new(on_spotify, publish_date)
  genre = Genre.new(genre)
  label = Label.new(label)
  author = Author.new(author)

  label.add_item(album)
  author.add_item(album)
  genre.add_item(album)

  @albums.push(music)
  @labels.push(label)
  @authors.push(music)

  puts 'Album created successfully!'
end
