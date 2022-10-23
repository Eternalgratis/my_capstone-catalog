require_relative 'spec_helper'

describe MusicAlbum do
  it 'creates a new music album instance' do
    music_album = MusicAlbum.new('Freeda', '12 December 2021', true)
    expect(music_album.on_spotify).to eq(true)
  end

  it 'creates a new music album instance' do
    album = MusicAlbum.new('Freeda', '12 December 2021', true)
    expect(album.title).to eq('Freeda')
  end

  it 'creates a new music album instance' do
    music = MusicAlbum.new('Freeda', '12 December 2021', true)
    expect(music.publish_date).to eq('12 December 2021')
  end
end
