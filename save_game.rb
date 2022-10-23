require 'json'
require_relative './author'
require_relative './game'

class SaveGame
  SAVE_DATA = './saved/'.freeze

  # write author
  def self.write_author(authors)
    author_array = []
    authors.each do |author|
      author_array << {
        id: author.id,
        first_name: author.first_name,
        last_name: author.last_name
      }
    end
    prev_data = File.read('./saved/author.json').empty? ? [] : JSON.parse(File.read('./saved/author.json'))
    prev_data.each do |data|
      author_array << data
    end
    File.write('./saved/author.json', author_array.to_json)
  end

  # read author
  def self.read_author
    puts 'No authors available' && return unless File.exist?('./saved/author.json')
    puts 'No authors available' && return if File.read('./saved/author.json').empty?
    author_file = File.read('./saved/author.json')
    data = JSON.parse(author_file)
    data.each do |author|
      puts "First name: #{author['first_name']}, Last name: #{author['last_name']}"
    end
    # author_file
  end

  # write the game
  def self.write_game(games)
    return if games.empty?

    game_array = []
    games.each do |game|
      game_array << {
        id: game.id,
        publish_date: game.publish_date,
        last_played: game.last_played_at,
        multiplayer: game.multiplayer
      }
    end
    prev_data = File.read('./saved/game.json').empty? ? [] : JSON.parse(File.read('./saved/game.json'))
    prev_data.each do |data|
      game_array << data
    end
    File.write('./saved/game.json', game_array.to_json)
  end

  # read game data
  def self.read_game
    puts 'No games available' && return unless File.exist?('./saved/game.json')
    puts 'No games available' && return if File.read('./saved/game.json').empty?
    game_file = File.read('./saved/game.json')
    data = JSON.parse(game_file)
    data.each do |game|
      puts "
      Publish Date: #{game['publish_date']},
      Last Played: #{game['last_played']},
      Multiplayer: #{game['multiplayer']}
      "
    end
  end
end
