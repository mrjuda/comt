require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date,
                 last_played_at = Time.now.strftime('%d/%m/%Y'),
                 multiplayer = 'false', archived = 'false')
    super(publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [publish_date, last_played_at, multiplayer, archived]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end

  private

  def can_be_archived?
    super && (Date.today.year - Date.parse(@last_played_at).year) > 2
  end
end
