require './music_functions'
require './genre'

describe Data do
  before :each do
    @data = Data.new
  end

  it 'Should return a new Data object' do
    expect(@data.class).to eql Data
  end

  it 'Should return length of 1' do
    genres = []
    genre = Genre.new('Pop')
    genres.push(genre)
    @data.list_genres(genre)
    expect(@data.items.length).to eql 1
  end

  it 'Should return name Pop' do
    genres = []
    genre = Genre.new('Pop')
    genres.push(genre)
    expect(@data.list_genres(genre)).to eql 'Pop'
  end
end
