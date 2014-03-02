require 'rspec'

require_relative '../lib/card'


describe 'PokerRanking::Card' do

  def get_card(card_name)
    PokerRanking::Card::by_name card_name
  end

  it 'should have a rank and a value' do
    card = get_card '10 of Diamonds'
    card.rank.should == '10'
    card.value.should == 10

    card = get_card 'King of Diamonds'
    card.rank.should == 'King'
    card.value.should == 13

    card = get_card '10 of Hearts'
    card.rank.should == '10'
    card.value.should == 10
  end

  it 'should be comparable based on value' do
    lCard = get_card '8 of Diamonds'
    rCard = get_card '9 of Diamonds'

    lCard.worth_less_than(rCard).should be_true
    rCard.worth_less_than(lCard).should be_false

    lCard = get_card '8 of Hearts'
    rCard = get_card '9 of Spades'

    lCard.worth_less_than(rCard).should be_true
    rCard.worth_less_than(lCard).should be_false
  end

  it 'should have a suit' do
    card = get_card '8 of Hearts'
    card.suit.should == 'Hearts'

    card = get_card 'King of Diamonds'
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
      card = get_card name

      card.rank.should == rank
      card.suit.should == suit
    end
  end
  
  it 'should return the name' do
    card = get_card 'Jack of Diamonds'

    card.to_s.should == 'Jack of Diamonds'
  end

  [
    [0, '2 of Hearts'],
    [1, '3 of Hearts'],
    [9, 'Jack of Hearts'],
    [23, 'Queen of Diamonds'],
    [37, 'King of Spades'],
    [51, 'Ace of Clubs'],
  ].each do |id, name|
    it "should return the card #{name} for id #{id}" do
      PokerRanking::Card::by_id(id).to_s.should == name
    end
  end

  it 'should return the data of the card as a hash' do
    PokerRanking::Card::by_name('5 of Diamonds').data.should == { rank: '5', suit: 'diamonds' }
    PokerRanking::Card::by_name('King of Diamonds').data.should == { rank: 'K', suit: 'diamonds' }
  end

  it 'should accept card names in a case insensitive manner' do
    PokerRanking::Card::by_name('king of diamonds').data.should == { rank: 'K', suit: 'diamonds' }
  end
end
