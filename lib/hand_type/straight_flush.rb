module PokerRanking
  module HandType
    class StraightFlush < Base

      SUITS = %w(Hearts Diamonds Spades Clubs)

      def handles?
        (value > 0)
      end

      def rank
        8
      end

      def value
        SUITS.each do |suit|
          value_for_suit = straight_value_of(cards.select { |card| card.suit == suit })
          return value_for_suit if value_for_suit > 0
        end
        0
      end

      def name
        'straight flush'
      end

      def cards_used
        SUITS.each do |suit|
          straight_in_suite = cards_in_straight(cards.select { |card| card.suit == suit })
          return straight_in_suite[-5..-1] if straight_in_suite.length >= 5
        end
      end

      def kickers
        []
      end
    end
  end
end
