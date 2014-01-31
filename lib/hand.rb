require 'card'

require_relative 'hand_type'

module PokerRanking


  class Hand

    HAND_TYPES = [HandType::StraightFlush, HandType::FourOfAKind, HandType::FullHouse, HandType::Flush, HandType::Straight, HandType::ThreeOfAKind, HandType::TwoPair, HandType::Pair, HandType::HighCard]

    attr_reader :cards
    attr_reader :rank
    attr_reader :value
    attr_reader :second_value
    attr_reader :kickers

    def initialize(*cards)
      @cards = []
      cards.each do |card|
        if card.is_a? PokerRanking::Card
          @cards << card
        elsif card.is_a? String
          @cards << PokerRanking::Card.new(card)
        else
          raise 'Hand initializer expects a card or a card name'
        end
      end

      if @cards.length > 0
        @cards.sort_by! { |card| card.value }

        calculate_rank
      end
    end


    def defeats?(other_hand)
      if @cards.length == 0
        return false
      end

      if other_hand.cards.length == 0
        return true
      end

      return self.rank > other_hand.rank unless self.rank == other_hand.rank
      return self.value > other_hand.value unless self.value == other_hand.value
      return self.second_value > other_hand.second_value unless self.second_value == other_hand.second_value
      self.kickers.each_with_index do |kicker,index|
        return kicker > other_hand.kickers[index] unless kicker == other_hand.kickers[index]
      end
      return false
    end

    def name
      hand_type.name
    end

    def ==(other)
      cards == other.cards
    end


    private

    def calculate_rank
      @rank = hand_type.rank
      @value = hand_type.value
      @second_value = hand_type.second_value
      @kickers = hand_type.kickers 
    end

    def hand_type
      HAND_TYPES.each do |hand_type_class|
        hand_type = hand_type_class.new @cards
        if hand_type.handles?
          return hand_type
        end
      end
    end
  end

end
