require_relative 'spec_helper'

describe 'pair' do

  describe 'defeats?' do
    it 'should rank a pair higher then a high card' do
      hand('8 of Clubs', '8 of Hearts').
          should_defeat hand('10 of Clubs', 'Jack of Spades')
    end

    it 'should rank a higher pair higher' do
      hand('Jack of Clubs', 'Jack of Hearts', 'Queen of Hearts').
          should_defeat hand('8 of Clubs', '8 of Hearts', 'King of Spades')
    end

    it 'should rank same pairs base on kicker' do
      hand('9 of Hearts','9 of Diamonds','Ace of Spades').
          should_defeat hand('9 of Clubs','9 of Spades','King of Clubs')
    end

    it 'should rank same pairs based on third kicker' do
      hand('9 of Hearts','9 of Diamonds','Ace of Spades','King of Clubs','Queen of Hearts').
          should_defeat hand('9 of Clubs','9 of Spades','Ace of Spades', 'King of Clubs','Jack of Hearts')
    end

    it 'should rank pairs equal after three kickers' do
      hand('9 of Hearts','9 of Diamonds','Ace of Spades','King of Clubs','Queen of Hearts','6 of Spades').
          should_tie_with hand('9 of Clubs','9 of Spades','Ace of Spades', 'King of Clubs','Queen of Hearts', 'Jack of Hearts')
    end

    it 'should rank pairs based on 3 low kicker correctly' do
      hand('4 of Spades', '6 of Hearts', '8 of Diamonds', 'Jack of Hearts', 'Jack of Spades').
          should_defeat hand('3 of Spades', '6 of Hearts', '8 of Diamonds', 'Jack of Hearts', 'Jack of Spades')
    end
  end

  describe '#name' do
    it 'should be called a pair' do
      expect(hand('4 of Spades', '6 of Hearts', '8 of Diamonds', 'Jack of Hearts', 'Jack of Spades').name).to eq 'pair'
    end
  end

  describe 'cards_used' do
    it 'should return the pair, and the 3 highest kickers' do
      pair_hand = hand('2 of Hearts','2 of Diamonds','Ace of Spades','King of Clubs','Queen of Hearts','6 of Spades')
      expect(pair_hand.cards_used).to eq cards('2 of Hearts','2 of Diamonds','Queen of Hearts','King of Clubs','Ace of Spades')
    end

    it 'should return the cards in value order' do
      pair_hand = hand('Jack of Hearts','Jack of Diamonds','Ace of Spades','King of Clubs','7 of Hearts','6 of Spades')
      expect(pair_hand.cards_used).to eq cards('7 of Hearts', 'Jack of Hearts','Jack of Diamonds','King of Clubs','Ace of Spades')
    end
  end
end
