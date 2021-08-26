require 'rails_helper'

RSpec.describe "songs index page", type: :feature do
  it "can see all songs titles and play count" do
    artist = Artist.create!(name: "CRJ")
    song_1 = Song.create!(title:       "I Really Like You",
                         length:      208,
                         play_count:  243810867,
                         artist_id: artist.id)
    song_2 = Song.create!(title:       "Call Me Maybe",
                        length:      199,
                        play_count:  1214722172,
                        artist_id: artist.id)

    visit '/songs'
    save_and_open_page
    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_1.play_count)
    expect(page).to have_content(song_2.title)
    expect(page).to have_content(song_2.play_count)
  end
end
