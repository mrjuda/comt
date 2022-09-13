require 'date'

class Item
  attr_reader :id, :archived
  attr_accessor :author, :genre, :label, :publish_date
end
