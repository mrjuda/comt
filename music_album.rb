require_relative './item'

# Album class
class MusicAlbum < Item
  attr_accessor :on_spotify, :archived, :publish_date
  attr_reader :genre, :author, :label

  def initialize(on_spotify, publish_date, author, genre, label)
    super(publish_date, id: nil)
    @on_spotify = on_spotify
    @publish_date = publish_date
    @archived = can_be_archived?
    add_props(author, genre, label)
  end

  private

  def can_be_archived?
    return true if @on_spotify == true

    false
  end
end
