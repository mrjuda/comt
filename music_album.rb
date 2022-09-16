require_relative './item'
require 'date'

# Album class
class MusicAlbum < Item
  attr_accessor :on_spotify, :archived, :publish_date
  attr_reader :genre

  def initialize(on_spotify, publish_date)
    super(publish_date, id: nil)
    @on_spotify = on_spotify
    @publish_date = publish_date
    @archived = can_be_archived?
    add_genre(genre)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [publish_date, on_spotify, archived]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end

  private

  def can_be_archived?
    return true if @on_spotify == true

    false
  end
end
