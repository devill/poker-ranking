require_relative 'spec_helper'


describe PokerRanking::Hand do
  it "should accept cards in it's constructor" do
    card = PokerRanking::Card::by_name('6 of Hearts')

    hand = PokerRanking::Hand.new([card])

    expect(hand.cards.first).to eq card
  end

  it "should accept card name in it's constructor" do
    card = PokerRanking::Card::by_name('6 of Hearts')

    hand = PokerRanking::Hand.new(['6 of Hearts'])

    expect(hand.cards.first).to eq card
  end

  it 'should accept card hashes' do
    card = PokerRanking::Card::by_name('6 of Hearts')

    hand = PokerRanking::Hand.new([{rank: 6, suit: 'Hearts'}])

    expect(hand.cards.first).to eq card
  end

  it 'should accept card hashes with string keys' do
    card = PokerRanking::Card::by_name('6 of Hearts')

    hand = PokerRanking::Hand.new([{'rank' => 6, 'suit' => 'Hearts'}])

    expect(hand.cards.first).to eq card
  end

  it 'should rank the empty hand below any other hand' do
    empty_hand = PokerRanking::Hand.new []
    other_hand = PokerRanking::Hand.new(['2 of Hearts'])

    expect(empty_hand.defeats?(other_hand)).to eq false
    expect(other_hand.defeats?(empty_hand)).to eq true
  end

  context "#data" do
    it "should contain the cards" do
      hand = PokerRanking::Hand.new(['6 of Hearts','6 of Spades', '6 of Diamonds', '10 of Diamonds', '10 of Clubs', 'Jack of Hearts'])
      expect(hand.data[:cards]).to eq [
          {rank: "6", suit: "hearts"},
          {rank: "6", suit: "spades"},
          {rank: "6", suit: "diamonds"},
          {rank: "10", suit: "clubs"},
          {rank: "10", suit: "diamonds"},
          {rank: "J", suit: "hearts"}
      ]
    end

    it "should contain the cards used" do
      hand = PokerRanking::Hand.new(['6 of Hearts','6 of Spades', '6 of Diamonds', '10 of Diamonds', '10 of Clubs', 'Jack of Hearts'])
      expect(hand.data[:cards_used]).to eq [
          {rank: "6", suit: "diamonds"},
          {rank: "6", suit: "spades"},
          {rank: "6", suit: "hearts"},
          {rank: "10", suit: "diamonds"},
          {rank: "10", suit: "clubs"},
      ]
    end

    it "should contain calculated ranking data" do
      hand = PokerRanking::Hand.new(['6 of Hearts','6 of Spades', '6 of Diamonds', '10 of Diamonds', '10 of Clubs'])

      expect(hand.data[:rank]).to eq 6
      expect(hand.data[:value]).to eq 6
      expect(hand.data[:second_value]).to eq 10
      expect(hand.data[:kickers]).to eq []

      hand = PokerRanking::Hand.new(['6 of Hearts','6 of Spades', '5 of Diamonds', '10 of Diamonds', '10 of Clubs'])

      expect(hand.data[:rank]).to eq 2
      expect(hand.data[:value]).to eq 10
      expect(hand.data[:second_value]).to eq 6
      expect(hand.data[:kickers]).to eq [5]
    end
  end

end