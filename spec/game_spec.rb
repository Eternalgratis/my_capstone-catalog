require_relative '../game'
describe Game do
  context 'Testing the Game class' do
    game = Game.new('02/05/2020', '03/04/2022', 'yes')

    it 'Return the exact publised date' do
      expect(game.publish_date).to eq '02/05/2020'
    end

    it 'Return the exact last played date' do
      expect(game.last_played_at).to eq '03/04/2022'
    end

    it 'Return the exact multiplayer' do
      expect(game.multiplayer).to eq 'yes'
    end
  end
end
