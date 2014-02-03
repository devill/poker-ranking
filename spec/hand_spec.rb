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

  it 'should rank the empty hand below any other hand' do
    empty_hand = PokerRanking::Hand.new []
    other_hand = PokerRanking::Hand.new(['2 of Hearts'])

    empty_hand.defeats?(other_hand).should == false
    other_hand.defeats?(empty_hand).should == true
  end
end