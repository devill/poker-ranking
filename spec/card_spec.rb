require 'rspec'

require_relative '../lib/card'

describe 'PokerRanking::Card' do

  it 'should have a rank and a value' do
    card = PokerRanking::Card.new 8
    card.rank.should == '10'
    card.value.should == 10

    card = PokerRanking::Card.new 11
    card.rank.should == 'King'
    card.value.should == 13

    card = PokerRanking::Card.new 21
    card.rank.should == '10'
    card.value.should == 10
  end

  it 'should be comparable based on value' do
    lCard = PokerRanking::Card.new 8
    rCard = PokerRanking::Card.new 9

    lCard.worth_less_than(rCard).should be_true
    rCard.worth_less_than(lCard).should be_false

    lCard = PokerRanking::Card.new 21
    rCard = PokerRanking::Card.new 10

    lCard.worth_less_than(rCard).should be_true
    rCard.worth_less_than(lCard).should be_false
  end

  it 'should have a suit' do
    card = PokerRanking::Card.new 8
    card.suit.should == 'Hearts'

    card = PokerRanking::Card.new 13
    card.suit.should == 'Diamonds'
  end

  [
      [ '2 of Spades', '2', 'Spades'],
      [ '3 of Spades', '3', 'Spades'],
      [ 'Jack of Spades', 'Jack', 'Spades'],
      [ 'Queen of Spades', 'Queen', 'Spades'],
      [ 'King of Spades', 'King', 'Spades'],
      [ 'Ace of Spades', 'Ace', 'Spades'],
      [ 'Jack of Hearts', 'Jack', 'Hearts']
  ].each do | name, rank, suit |
    it "should create correct card when passed #{name}" do
      card = PokerRanking::Card.new name

      card.rank.should == rank
      card.suit.should == suit
    end
  end
  
  it 'should return the name' do
    card = PokerRanking::Card.new 22

    card.to_s.should == 'Jack of Diamonds'
  end

end
