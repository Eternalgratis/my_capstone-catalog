require './save_game'
class Author
  attr_accessor :id, :first_name, :last_name
  attr_reader :games

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @games = []
  end

  def add_game(game)
    @games << game unless @games.include?(game)
    game.author = self
  end
end
