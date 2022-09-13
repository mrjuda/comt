require_relative 'item'

class Genre < Item
  attr_accessor :name, :items
  attr_reader :id

  def initialize(id, name)
    @id = id || Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
  end
end
