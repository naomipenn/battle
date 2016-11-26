require 'player'

describe Player do
  subject(:sara) { Player.new('Sara') }
  subject(:zelda) { Player.new('Zelda') }

  describe '#name' do
    it 'returns the name' do
      expect(sara.name).to eq 'Sara'
    end
  end

  describe '#hit_points' do
    it 'returns the hit points' do
      expect(sara.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(zelda).to receive(:receive_damage)
      sara.attack(zelda)
    end
  end

  describe '#receive_damage' do
    it 'reduces the player hit points' do
      expect { sara.receive_damage }.to change { sara.hit_points }.by(-10)
    end
  end
end
