require_relative '../lib/item'
require_relative 'genre'
require 'date'

# Album class
class MusicAlbum < Item
  attr_accessor :on_spotify, :archived, :publish_date
  attr_reader :genre

  def initialize(on_spotify, publish_date, genre, author)
    super(publish_date)
    @id = Random.rand(1..1000)
    @on_spotify = on_spotify
    @publish_date = publish_date
    @archived = can_be_archived?
    @genre = genre
    @author = author
  end

  private

  def can_be_archived?
    return true if @on_spotify == true

    false
  end
end
