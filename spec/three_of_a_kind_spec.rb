require_relative 'spec_helper'

describe 'Three of a kind' do
  describe 'defeats?' do
    it 'should rank three of a kind over two pair' do
      hand('Jack of Spades', 'Jack of Hearts', 'Jack of Clubs').
          should_defeat hand('King of Hearts', 'King of Diamonds', 'Queen of Spades', 'Queen of Hearts')
    end

    it 'should rank a higher three of a kind higher' do
      hand('Queen of Diamonds', 'Jack of Spades', 'Jack of Hearts', 'Jack of Clubs').
          should_defeat hand('King of Hearts', '10 of Diamonds', '10 of Spades', '10 of Hearts')
    end

    it 'should rank three of a kind on the kickers' do
      hand('Queen of Diamonds', 'Jack of Spades', 'Jack of Hearts', 'Jack of Clubs', 'Ace of Hearts').
          should_defeat hand('Queen of Diamonds', 'Jack of Spades', 'Jack of Hearts', 'Jack of Clubs', '2 of Hearts')
    end

    it 'should rank three of a kind with only two kickers' do
      hand('Queen of Diamonds', 'Jack of Spades', 'Jack of Hearts', 'Jack of Clubs', 'Ace of Hearts', '4 of Diamonds').
          should_tie_with hand('Queen of Diamonds', 'Jack of Spades', 'Jack of Hearts', 'Jack of Clubs', 'Ace of Hearts', '2 of Hearts')
    end
  end

  describe '#name' do
    it 'should be called three of a kind' do
      expect(hand('Queen of Diamonds', 'Jack of Spades', 'Jack of Hearts', 'Jack of Clubs', 'Ace of Hearts').name).to eq 'three of a kind'
    end
  end

  describe '#cards_used' do
    it 'should return the three of a kind plus two kickers' do
      three_of_a_kind_hand = hand('Queen of Diamonds', 'Jack of Spades', 'Jack of Hearts', 'Jack of Clubs', 'Ace of Hearts', 'King of Diamonds')
      expect(three_of_a_kind_hand.cards_used).to eq cards('Jack of Spades', 'Jack of Hearts', 'Jack of Clubs', 'King of Diamonds', 'Ace of Hearts')
    end
  end
end
