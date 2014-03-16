require_relative 'spec_helper'

describe 'Four of a kind' do
  describe 'defeats?' do
    it 'should rank four of a kind over full house' do
      hand('10 of Diamonds', '10 of Hearts', '10 of Spades', '10 of Clubs').
          should_defeat hand('Jack of Diamonds', 'Jack of Hearts', 'Jack of Spades', 'King of Spades', 'King of Clubs')
    end

    it 'should rank higher four of a kind higher' do
      hand('Jack of Diamonds', 'Jack of Hearts', 'Jack of Spades', 'Jack of Clubs', 'Queen of Hearts').
          should_defeat hand('10 of Diamonds', '10 of Hearts', '10 of Spades', '10 of Clubs', 'Ace of Spades')
    end

    it 'should rank four of a kind with the kicker' do
      hand('Jack of Diamonds', 'Jack of Hearts', 'Jack of Spades', 'Jack of Clubs', 'Queen of Hearts').
          should_defeat hand('Jack of Diamonds', 'Jack of Hearts', 'Jack of Spades', 'Jack of Clubs', '5 of Hearts')
    end

    it 'should rank four of kind equally after first kicker' do
      hand('Jack of Diamonds', 'Jack of Hearts', 'Jack of Spades', 'Jack of Clubs', 'Queen of Hearts', '7 of Hearts').
          should_tie_with hand('Jack of Diamonds', 'Jack of Hearts', 'Jack of Spades', 'Jack of Clubs', 'Queen of Hearts', '5 of Hearts')
    end

    it 'should rank four of a kind kicker higher even if the kicker is a pair' do
      hand('Jack of Diamonds', 'Jack of Hearts', 'Jack of Spades', 'Jack of Clubs', 'Queen of Hearts', 'Queen of Spades').
          should_defeat hand('Jack of Diamonds', 'Jack of Hearts', 'Jack of Spades', 'Jack of Clubs', '5 of Hearts', '4 of Hearts')
    end
  end

  describe '#name' do
    it 'should be called four of a kind' do
      expect(hand('10 of Diamonds', '10 of Hearts', '10 of Spades', '10 of Clubs', 'Jack of Spades').name).to eq 'four of a kind'
    end
  end
end
