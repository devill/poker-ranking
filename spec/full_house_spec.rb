require_relative 'spec_helper'

describe 'Full house' do
  describe 'defeats?' do
    it 'should rank a full house over a flush' do
      hand('10 of Diamonds', '10 of Hearts', '10 of Spades', 'Jack of Spades', 'Jack of Clubs').
          should_defeat hand('2 of Hearts', '4 of Hearts', '5 of Hearts', '9 of Hearts', 'King of Hearts')
    end

    it 'should allow extra cards in a full house' do
      hand('10 of Diamonds', '10 of Hearts', '10 of Spades', 'Jack of Spades', 'Jack of Clubs', 'Jack of Hearts').
          should_defeat hand('2 of Hearts', '4 of Hearts', '5 of Hearts', '9 of Hearts', 'King of Hearts')

      hand('10 of Diamonds', '10 of Hearts', '10 of Spades', 'Jack of Spades', 'Jack of Clubs', 'King of Clubs').
          should_defeat hand('2 of Hearts', '4 of Hearts', '5 of Hearts', '9 of Hearts', 'King of Hearts')
    end

    it 'should rank higher full house higher' do
      hand('10 of Diamonds', '10 of Hearts', '10 of Spades', 'Jack of Spades', 'Jack of Clubs').
          should_defeat hand('9 of Diamonds', '9 of Hearts', '9 of Spades', 'King of Spades', 'King of Clubs')
    end

    it 'should rank higher full house based on pair if trips is same' do
      hand('10 of Diamonds', '10 of Hearts', '10 of Spades', 'Jack of Spades', 'Jack of Clubs').
          should_defeat hand('10 of Diamonds', '10 of Hearts', '10 of Spades', '5 of Spades', '5 of Clubs')
    end

    it 'should ignore unused cards' do
      hand('Queen of Spades', 'Queen of Hearts', 'King of Diamonds', 'King of Clubs', '2 of Spades', 'Queen of Diamonds', '3 of Spades').
          should_tie_with hand('Queen of Spades', 'Queen of Hearts', 'King of Diamonds', 'King of Clubs', '2 of Spades', 'Queen of Clubs', '4 of Spades')
    end
  end

  describe '#name' do
    it 'should be called a full house' do
      hand('10 of Diamonds', '10 of Hearts', '10 of Spades', 'Jack of Spades', 'Jack of Clubs').name.should == 'full house'
    end
  end

end
