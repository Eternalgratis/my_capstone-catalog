require 'json'

class UserOutput
  def self.populate_albums
    return [] unless File.exist?('./json/musicalbums.json')

    albums = []
    object = JSON.parse(File.read('./json/musicalbums.json'))
    object.each do |album|
      genre = Genre.new(album['genre'])
      musicalbum_json = MusicAlbum.new(album['release_date'], album['title'], album['on_spotify'])
      genre.add_item(musicalbum_json)
      albums << musicalbum_json
    end
    albums
  end

  def self.populate_genres
    return [] unless File.exist?('./json/genres.json')

    genres = []
    object = JSON.parse(File.read('./json/genres.json'))
    object.each do |genre|
      genre_json = Genre.new(genre['name'])
      genre_json.id = genre['id']
      genres << genre_json
    end
    genres
  end

  def self.populate_data(albums, genres)
    populate_albums(albums)
    populate_genres(genres)
  end
end
