require_relative '../author'

describe Author do
  context 'Testing the Game class' do
    game = Author.new('Micheal', 'Freeman')

    it 'Return the exact first name' do
      expect(game.first_name).to eq 'Micheal'
    end

    it 'Return the exact last name' do
      expect(game.last_name).to eq 'Freeman'
    end
  end
end
