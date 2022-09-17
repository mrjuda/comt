require './lib/music_functions'
require './lib/genre'

describe MusicData do
  before :each do
    @data = MusicData.new
  end

  it 'Should return a new Data object' do
    expect(@data.class).to eql MusicData
  end

  it 'Should return length of 1' do
    genre = Genre.new('Pop')
    expect(genre).to be_instance_of Genre
  end

  it 'Should return length of 1' do
    genres = []
    genre = Genre.new('Pop')
    genres.push(genre)
    expect(genres.length).to eql 1
  end

  it 'Should return name Pop' do
    genres = []
    genre = Genre.new('Pop')
    genres.push(genre)
    expect(@data.list_genres(genres)).to eql 'Pop'
  end
end
