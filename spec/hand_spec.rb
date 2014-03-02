require_relative 'spec_helper'


describe PokerRanking::Hand do
  it "should accept cards in it's constructor" do
    card = PokerRanking::Card::by_name('6 of Hearts')

    hand = PokerRanking::Hand.new([card])

    hand.cards.first.should == card
  end

  it "should accept card name in it's constructor" do
    card = PokerRanking::Card::by_name('6 of Hearts')

    hand = PokerRanking::Hand.new(['6 of Hearts'])

    hand.cards.first.should == card
  end

  it 'should accept card hashes' do
    card = PokerRanking::Card::by_name('6 of Hearts')

    hand = PokerRanking::Hand.new([{rank: 6, suit: 'Hearts'}])

    hand.cards.first.should == card
  end

  it 'should accept card hashes with string keys' do
    card = PokerRanking::Card::by_name('6 of Hearts')

    hand = PokerRanking::Hand.new([{'rank' => 6, 'suit' => 'Hearts'}])

    hand.cards.first.should == card
  end

  it 'should rank the empty hand below any other hand' do
    empty_hand = PokerRanking::Hand.new []
    other_hand = PokerRanking::Hand.new(['2 of Hearts'])

    empty_hand.defeats?(other_hand).should == false
    other_hand.defeats?(empty_hand).should == true
  end

  context "#data" do
    it "should contain the cards" do
      hand = PokerRanking::Hand.new(['6 of Hearts','6 of Spades', '6 of Diamonds', '10 of Diamonds', '10 of Clubs'])
      hand.data[:cards].should == [
          {rank: "6", suit: "hearts"},
          {rank: "6", suit: "spades"},
          {rank: "6", suit: "diamonds"},
          {rank: "10", suit: "diamonds"},
          {rank: "10", suit: "clubs"}
      ]
    end

    it "should contain calculated ranking data" do
      hand = PokerRanking::Hand.new(['6 of Hearts','6 of Spades', '6 of Diamonds', '10 of Diamonds', '10 of Clubs'])

      hand.data[:rank].should == 6
      hand.data[:value].should == 6
      hand.data[:second_value].should == 10
      hand.data[:kickers].should == []

      hand = PokerRanking::Hand.new(['6 of Hearts','6 of Spades', '5 of Diamonds', '10 of Diamonds', '10 of Clubs'])

      hand.data[:rank].should == 2
      hand.data[:value].should == 10
      hand.data[:second_value].should == 6
      hand.data[:kickers].should == [5]
    end
  end

end