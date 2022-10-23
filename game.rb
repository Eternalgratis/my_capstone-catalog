require_relative './item'
require './save_game'

class Game < Item
  attr_reader :id
  attr_accessor :author, :publish_date, :multiplayer, :last_played_at, :first_name, :last_name

  def initialize(publish_date, last_played_at, multiplayer)
    super(publish_date)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
    @author = author
  end

  private

  def can_be_archived?
    super && Date.today - Date.parse(@last_played_at) > 730
  end
end
