require './item'
require './book'
require './label'
require './music_album'
require './genre'
require './preserve/input'
require './preserve/output'
require_relative './json_handler'
require './validity'
require './game'
require './author'
require_relative './save_game'

class App
  def initialize
    @books = []
    @labels = []
    @albums = UserOutput.populate_albums
    @genres = UserOutput.populate_genres
    @games = []
    @authors = []
  end

  def options
    'Do you want to choose an option in the menu? Please type an option number:
    1. List all books
    2. List all Music Album
    3. list all Games 🎮📃
    4. List all Genres
    5. List all labels
    6. List all Authors 📃👨‍🏫
    7. Add a book
    8. Add a Music Album
    9. Add Game 🎮🎇
    10. Exit
    Please choose an option:'
  end

  def menu
    puts 'Welcome to my catalog'
    puts '💥💥💥💥💥💥💥'
    loop do
      puts options
      puts '***********'
      option = gets.chomp.to_i
      case option
      when 1
        JsonHandler.read_books
      when 2
        MusicAlbum.list_all_albums(@albums)
      when 3
        SaveGame.read_game
      when 4
        Genre.list_all_genres(@genres)
      when 5
        JsonHandler.read_labels
      when 6
        SaveGame.read_author
      when 7
        add_book
        JsonHandler.write_books(@books)
        JsonHandler.write_labels(@labels)
      when 8
        MusicAlbum.create_music_album(@albums, @genres)
      when 9
        create_game
        SaveGame.write_game(@games)
        SaveGame.write_author(@authors)
      when 10
        UserInput.save_data(@albums, @genres)
        exit
      else
        puts 'Invalid option'

      end
    end
  end

  def add_book
    puts 'Add a book'
    print 'Publish Date[dd/mm/yyyy]: '
    publish_date = gets.chomp
    publish_date = DateValidation.get_date(publish_date)
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state Date["good" or "bad"]: '
    cover_state = gets.chomp.downcase
    new_book = Book.new(publish_date, publisher, cover_state)
    new_label = add_label
    new_label.add_book(new_book)
    @books << new_book
    @labels << new_label
    puts '💥A book is added successfullly'
    puts ''
  end

  def add_label
    puts 'Add a label'
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    Label.new(title, color)
  end

  def list_all_books
    if @books.empty?
      puts '💥💥The catalog has no books'
    else
      puts '💥List of all books:'
      @books.each_with_index do |book, index|
        puts "
        #{index + 1} Publish_date: #{book.publish_date},
        Publisher: #{book.publisher},
        Cover_state: #{book.cover_state}"
      end
    end
    puts ''
  end

  def list_all_labels
    if @labels.empty?
      puts 'The Catalog has no labels'
    else
      puts '💥List of all labels:'
      @labels.each_with_index do |book, index|
        puts "[#{index + 1}] Title: #{book.title}, Color: #{book.color}"
      end
    end
    puts ''
  end

  def create_game
    print 'Date Published: '
    publish_date = gets.chomp
    print 'Last Played (eg:[2019/01/04]): '
    last_played = gets.chomp
    print 'It is a Multiplayer game [Y/N]: '
    multiplayer_game = gets.chomp
    multiplayer_choice = case multiplayer_game.downcase
                         when 'y'
                           'Yes'
                         else
                           'No'
                         end
    game = Game.new(publish_date, last_played, multiplayer_choice)
    author = add_author
    author.add_game(game)
    @games << game
    @authors << author
    print 'Game created successfully 😊 😀'
    puts ''
  end

  def add_author
    print 'Enter first name: '
    first_name = gets.chomp
    print 'Enter last name: '
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end

  def list_author
    if @authors.empty?
      puts 'Sorry there are no authors available 😔'
      puts ''
    else
      @authors.each_with_index do |author, i|
        puts "#{i} ID:\"#{author.id}\", First Name: \"#{author.first_name}\", Last Name :\"#{author.last_name}\" "
        puts '👨‍🏫📃'
      end
    end
  end

  def list_games
    puts 'Sorry! There are no games ☹️ , please add a game by using the list of options.' if @games.empty?
    puts ''
    @games.each_with_index do |game, i|
      puts "
      #{i} Published date:\"#{game.publish_date}\",
      Last Played:\"#{game.last_played_at}\",
      Multiplayer:\"#{game.multiplayer}\"
      "
    end
  end
end
