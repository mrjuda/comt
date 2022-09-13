require 'date'

class Item
  attr_reader :id, :archived
  attr_accessor :author, :genre, :label, :publish_date

  def initialize(id, publish_date)
    @id = id || Random.rand(1..1000)
    @archived = false
    @publish_date = Date.parse(publish_date)
  end

  def add_props(author, genre, label)
    @author = author
    @genre = genre
    @label = label
  end

  def can_be_archived?
    return true if ((DateTime.now - @publish_date) / 365).to_i > 10
    false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
