require_relative './book'
require_relative './label'
require_relative './item'
require 'json'

class JsonHandler
  DATA_DIRECTORY = './data_json/'.freeze

  def self.read_books
    puts 'No books available' && return unless File.exist?('./data_json/books.json')
    puts 'No books available' && return if File.read('./data_json/books.json').empty?

    books_file = File.read('./data_json/books.json')
    JSON.parse(books_file).each do |book|
      puts "
        publish_date: #{book['publish_date']},
        publisher: #{book['publisher']},
        cover_state: #{book['cover_state']}
      "
    end
  end

  # WRITING TO THE BOOK
  def self.write_books(books)
    return if books.empty?

    book_array = []
    books.each do |book|
      book_array << {
        id: book.id,
        publish_date: book.publish_date,
        publisher: book.publisher,
        cover_state: book.cover_state
      }
    end
    prev_data = File.read('./data_json/books.json').empty? ? [] : JSON.parse(File.read('./data_json/books.json'))
    prev_data.each do |data|
      book_array << data
    end
    File.write('./data_json/books.json', book_array.to_json)
  end

  def self.read_labels
    puts 'No labels available' && return unless File.exist?('./data_json/labels.json')
    puts 'No labels available' && return if File.read('./data_json/labels.json').empty?

    labels_file = File.read('./data_json/labels.json')
    JSON.parse(labels_file).each do |label|
      puts "
        Title: #{label['title']},
        Color: #{label['color']}
      "
    end
  end

  def self.write_labels(labels)
    return if labels.empty?

    label_array = []
    labels.each do |label|
      label_array << {
        title: label.title,
        color: label.color
      }
    end
    prev_data = File.read('./data_json/labels.json').empty? ? [] : JSON.parse(File.read('./data_json/labels.json'))
    prev_data.each do |data|
      label_array << data
    end
    File.write('./data_json/labels.json', label_array.to_json)
  end
end
