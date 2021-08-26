require 'rails_helper'

RSpec.describe Artist, type: :model do
  it {should have_many :songs}

  describe 'instance methods' do
    describe '#average_song_length' do
      before :each do
        @prince = Artist.create!(name: 'Prince')
        @purple = @prince.songs.create!(title: 'Purple Rain', length: 534, play_count: 34895)
        @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 342, play_count: 7831)
        @doves = @prince.songs.create!(title: 'When Doves Cry', length: 452, play_count: 23482)
      end

      it 'returns the average song length' do
        expect(@prince.average_song_length.round(2)).to eq(442.67)
      end
    end
  end
end
