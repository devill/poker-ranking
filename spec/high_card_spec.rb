require_relative 'spec_helper'

describe 'High Card' do

  describe 'defeats?' do
    it 'should be comparable when both are high card' do
      hand('10 of Hearts', '7 of Diamonds').
          should_defeat hand('8 of Clubs', '7 of Diamonds')
    end
  end

  describe '#name' do
    it 'should be called a High Card' do
      expect(hand('10 of Hearts', '7 of Diamonds').name).to eq 'high card'
    end
  end

  describe '#used_cards' do
    it 'should return the 5 highest cards' do
      high_cards = hand('10 of Hearts', '2 of Diamonds', 'King of Diamonds', 'Ace of Spades', '5 of Clubs', 'Jack of Clubs')
      expect(high_cards.cards_used).to eq cards('5 of Clubs', '10 of Hearts', 'Jack of Clubs', 'King of Diamonds', 'Ace of Spades')
    end
  end
end


