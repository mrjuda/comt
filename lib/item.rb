require 'date'
class Item
  attr_accessor :publish_date, :author, :label, :genre
  attr_reader :archived

  def initialize(publish_date, archived: false)
    @publish_date = publish_date
    @archived = archived
    @genre = nil
    @author = nil
    @label = nil
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_label(label)
    @label = label
    label.items.push(self) if defined?(@label.items) && !label.items.include?(self)
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self)
  end

  def add_author(author)
    @author = author
    author.add_item(self)
  end

  private

  def can_be_archived?
    current_date = Date.today.year
    current_date - Date.parse(publish_date).year > 10
  end
end
