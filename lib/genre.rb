require_relative 'item'
require 'json'

# Genre class
class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_genre(item)
    @items.push(item) unless @items.include?(item)
    item.author = self
  end
end
