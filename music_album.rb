# Album class
class MusicAlbum
  attr_accessor :title, :on_spotify

  def initialize(on_spotify)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if @on_spotify == true

    false
  end
end
