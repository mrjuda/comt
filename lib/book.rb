# book.rb

require_relative '../lib/item'
require 'date'

class Book < Item
  def initialize(date, publisher, cover_state, label)
    super(date)
    @publisher = publisher
    @cover_state = cover_state
    @label = label
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def book_to_hash
    { publisher: @publisher, cover_state: @cover_state, label: @label }
  end
end
