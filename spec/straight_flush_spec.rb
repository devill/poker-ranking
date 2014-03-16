require_relative 'spec_helper'

describe 'Straight Flush' do
  describe 'defeats?' do
    it 'should rank a straight flush over four of a kind' do
      hand('10 of Spades', 'Jack of Spades', 'Queen of Spades', 'King of Spades', 'Ace of Spades').
          should_defeat hand('Jack of Diamonds', 'Jack of Hearts', 'Jack of Spades', 'Jack of Clubs', 'Queen of Hearts')
    end

    it 'should rank a higher straight flush higher' do
      hand('10 of Spades', 'Jack of Spades', 'Queen of Spades', 'King of Spades', 'Ace of Spades').
          should_defeat hand('9 of Spades', '10 of Spades', 'Jack of Spades', 'Queen of Spades', 'King of Spades')
    end

    it 'should not recognize a straight and a flush as a straight flush' do
      hand('Jack of Diamonds', 'Jack of Hearts', 'Jack of Spades', 'Jack of Clubs', 'Queen of Hearts').
          should_defeat hand('6 of Spades', '10 of Spades', 'Jack of Spades', 'Queen of Spades', 'King of Spades', 'Ace of Hearts')
    end

    it 'should ignore extra high cards from a straight flush' do
      hand('4 of Spades', '5 of Spades', '6 of Spades', '7 of Spades', '8 of Spades', 'Queen of Spades').
          should_defeat hand('3 of Spades', '4 of Spades', '5 of Spades', '6 of Spades', '7 of Spades', 'King of Spades')
    end
  end

  describe '#name' do
    it 'should be called a straight flush' do
      expect(hand('10 of Spades', 'Jack of Spades', 'Queen of Spades', 'King of Spades', 'Ace of Spades').name).to eq 'straight flush'
    end
  end

  describe '#cards_used' do
    it 'should return the pair, and the 3 highest kickers' do
      two_pair_hand = hand('5 of Hearts', '6 of Hearts', '7 of Hearts', '8 of Hearts', '9 of Hearts', '10 of Hearts', 'Jack of Spades', 'King of Hearts')
      expect(two_pair_hand.cards_used).to eq cards('6 of Hearts', '7 of Hearts', '8 of Hearts', '9 of Hearts', '10 of Hearts')
    end
  end
end
