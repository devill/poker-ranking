require_relative 'spec_helper'

describe 'Straight' do
  it 'should rank a straight over three of a kind' do
    hand('8 of Clubs', '9 of Spades', '10 of Spades', 'Jack of Hearts', 'Queen of Diamonds').
        should_defeat hand('King of Spades', 'King of Hearts', 'King of Clubs')
  end

  context 'as a convenience for Texas Hold\'em' do
    it 'should accept longer straights' do
      hand('8 of Clubs', '9 of Spades', '10 of Spades', 'Jack of Hearts', 'Queen of Diamonds', 'King of Diamonds').
          should_defeat hand('Jack of Spades', 'Jack of Hearts', 'Jack of Clubs')
    end


    it 'should ignore extra cards at the ends of a straight' do
      hand('4 of Diamonds', '7 of Hearts', '8 of Clubs', '9 of Spades', '10 of Spades', 'Jack of Hearts', 'King of Diamonds').
          should_defeat hand('Jack of Spades', 'Jack of Hearts', 'Jack of Clubs')
    end

    it 'should ignore extra cards within the straight' do
      hand('8 of Clubs', '9 of Spades', '10 of Spades', 'Jack of Hearts', 'Queen of Diamonds').
          should_defeat hand('King of Spades', 'King of Hearts', 'King of Clubs')
    end
  end

  it 'should rank a higher straight higher' do
    hand('8 of Clubs', '9 of Spades', '10 of Spades', 'Jack of Hearts', 'Queen of Diamonds').
        should_defeat hand('6 of Diamonds', '7 of Hearts', '8 of Spades',  '9 of Hearts', '10 of Clubs', 'King of Diamonds')

    hand('8 of Clubs', '9 of Spades', '10 of Spades', 'Jack of Hearts', 'Queen of Diamonds').
        should_defeat hand('Ace of Clubs', '2 of Hearts', '3 of Spades', '4 of Diamonds', '5 of Hearts')
  end

  it 'should accept Ace as one' do
    hand('Ace of Clubs', '2 of Hearts', '3 of Spades', '4 of Diamonds', '5 of Hearts').
        should_defeat hand('King of Spades', 'King of Hearts', 'King of Clubs')
  end

  it 'should be called a straight' do
    hand('8 of Clubs', '9 of Spades', '10 of Spades', 'Jack of Hearts', 'Queen of Diamonds').name.should == 'straight'
  end
end
