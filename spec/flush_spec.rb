require_relative 'spec_helper'

describe 'Flush' do
  describe 'defeats?' do
    it 'should rank a flush over a straight' do
      hand('2 of Hearts', '4 of Hearts', '5 of Hearts', '9 of Hearts', 'Jack of Hearts').
          should_defeat hand('9 of Spades', '10 of Spades', 'Jack of Hearts', 'Queen of Diamonds', 'King of Diamonds')

      hand('2 of Clubs', '4 of Clubs', '5 of Clubs', '9 of Clubs', 'Jack of Clubs').
          should_defeat hand('9 of Spades', '10 of Spades', 'Jack of Hearts', 'Queen of Diamonds', 'King of Diamonds')
    end

    it 'should ignore extra cards in a flush' do
      hand('2 of Hearts', '4 of Hearts', '5 of Hearts', '9 of Hearts', 'Jack of Hearts', 'Jack of Clubs').
          should_defeat hand('9 of Spades', '10 of Spades', 'Jack of Hearts', 'Queen of Diamonds', 'King of Diamonds')

      hand('2 of Hearts', '4 of Hearts', '5 of Hearts', '9 of Hearts', 'Jack of Hearts', 'King of Hearts').
          should_defeat hand('9 of Spades', '10 of Spades', 'Jack of Hearts', 'Queen of Diamonds', 'King of Diamonds')
    end

    it 'should rank higher flush higher' do
      hand('2 of Hearts', '4 of Hearts', '5 of Hearts', '9 of Hearts', 'King of Hearts').
          should_defeat hand('2 of Clubs', '4 of Clubs', '5 of Clubs', '9 of Clubs', 'Jack of Clubs')
    end

    it 'should rank the flush on each of the values' do
      hand('2 of Hearts', '4 of Hearts', '5 of Hearts', '9 of Hearts', 'King of Hearts').
          should_defeat hand('2 of Clubs', '3 of Clubs', '5 of Clubs', '9 of Clubs', 'King of Clubs')
    end

    it 'should ignore the extra cards when determining kickers' do
      hand('2 of Hearts', '4 of Hearts', '5 of Hearts', '9 of Hearts', 'King of Hearts', 'Queen of Spades').
          should_defeat hand('2 of Clubs', '3 of Clubs', '5 of Clubs', '9 of Clubs', 'King of Clubs', 'Ace of Spades')
    end

    it 'should only count a flush as 5 cards' do
      hand('6 of Hearts', '7 of Hearts', '8 of Hearts', '9 of Hearts', 'King of Hearts', '2 of Hearts').
          should_tie_with hand('6 of Clubs', '7 of Clubs', '8 of Clubs', '9 of Clubs', 'King of Clubs', '3 of Clubs')
    end

    it 'should still be a flush as long as we have 5' do
      hand('6 of Hearts', '7 of Hearts', '8 of Hearts', '9 of Hearts', 'King of Hearts', '2 of Hearts').
          should_tie_with hand('6 of Clubs', '7 of Clubs', '8 of Clubs', '9 of Clubs', 'King of Clubs', '3 of Diamonds')
    end
  end

  describe '#name' do
    it 'should be called a flush' do
      expect(hand('2 of Hearts', '4 of Hearts', '5 of Hearts', '9 of Hearts', 'Jack of Hearts').name).to eq 'flush'
    end
  end

  describe '#cards_used' do
    it 'should return the three of a kind plus two kickers' do
      three_of_a_kind_hand =  hand('6 of Hearts', '7 of Hearts', '8 of Hearts', '9 of Hearts', 'King of Hearts', '2 of Hearts','Queen of Spades')
      expect(three_of_a_kind_hand.cards_used).to eq cards('6 of Hearts', '7 of Hearts', '8 of Hearts', '9 of Hearts', 'King of Hearts')
    end
  end

end
