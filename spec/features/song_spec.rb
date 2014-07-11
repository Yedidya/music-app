require 'rails_helper'

describe "songs" do

  it "should add a new song to the database when the new song field is filled out" do
    visit new_song_path
    fill_in('Title', :with => 'TarTar')
    fill_in('Tags', :with => 'guitar, drums')
    click_button('Create Song')

    song = Song.last

    expect(song.title).to eq('TarTar')
  end
end